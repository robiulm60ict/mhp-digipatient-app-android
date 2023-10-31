import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/auth_model/RegistrationModel.dart';
import '../model/auth_model/birth_sex_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '../repository/doctor_screen_repo/patient_list_repo.dart';
import '/repository/auth_repository.dart';
import '/routes/routes.gr.dart';
import '/utils/message.dart';
import 'doctor_screen_view_model/all_patient_list_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loginLoading = false;
  bool _signupLoading = false;

  bool get loginLoading => _loginLoading;

  bool get signupLoading => _signupLoading;

  // UserViewModel userViewModel = UserViewModel();
  //TODO: Add user view model

  setLoginLoading(bool value, LoginModel? val) {
    _loginLoading = value;
    user = val;
    notifyListeners();
  }

  setSignupLoading(
    bool value,
  ) {
    _signupLoading = value;
    notifyListeners();
  }

  LoginModel? user;

  saveDocFcm() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(UserP.fcmToken).toString();

    Map<String, String> body = {'token': token};

    final String docId = prefs.getInt(UserP.id).toString();
    patientListRepo
        .saveDocFCMToken(docId: docId, body: body)
        .then((value) => null)
        .onError((e, stackTrace) {
      debugPrint("fcm error $e");
    });
  }

  PatientListRepo patientListRepo = PatientListRepo();

  savePtnFcm() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(UserP.fcmToken).toString();
    Map<String, String> body = {'token': token};

    final String ptnId = prefs.getInt(UserP.id).toString();
    patientListRepo
        .savePtnFCMToken(ptnId: ptnId, body: body)
        .then((value) =>
            debugPrint("\n\n\n\n Fcm token saved ${value.patient?.appToken}"))
        .onError((e, stackTrace) {
      debugPrint("\n\n\n\n\nfcm error $e");
    });
  }

  Future<void> loginApi(BuildContext context, dynamic body,
      {bool keepMeSignIn = true}) async {
    setLoginLoading(true, null);
    _authRepo.loginApi(body).then((value) async {
      Messages.flushBarMessage(context, '${value.message}',
          backgroundColor: AppColors.primaryColor);

      await saveUser(
          isLoggedIn: keepMeSignIn,
          email: body['email'],
          password: body['password'],
          name: value.user!.name!,
          id: int.parse(value.user!.userId!),
          role: value.user!.userType ?? "",
          token: value.token.toString());
      Future.delayed(const Duration(seconds: 1)).then((v) {
        setLoginLoading(false, value);
        context.router.replace(const DashboardRoute());
        // if (value.user!.userType.toString().toLowerCase() == "patient") {
        //   //  savePtnFcm();
        //   context.router.replace(const DashboardRoute());
        // } else if (value.user!.userType.toString().toLowerCase() == "doctor") {
        //   // saveDocFcm();
        //   context.read<DoctorScreenViewModel>().getAllPatientList(context);
        // } else {
        //   Messages.flushBarMessage(context,
        //       "Role is not in the code ${value.user!.userType.toString().toLowerCase()}");
        // }
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Messages.flushBarMessage(context, error.toString());
      setLoginLoading(false, null);
    });
  }

  bool isSendOtpLoading = false;

  setSendOtpLoading(bool val) {
    isSendOtpLoading = val;
    notifyListeners();
  }

  List<SendVerificationModel> otpList = [];

  Future<void> sendOtp(BuildContext context,
      {required String phnNumber}) async {
    Map<String, dynamic> body = {"phone_number": phnNumber};
    setSendOtpLoading(true);
    otpList.clear();
    await _authRepo.sendOTP(body: body).then((value) {
      print(value.toString());
      otpList.add(value);
      setSendOtpLoading(false);
      context.router.push(PinCodeVerificationRoute(phoneNumber: phnNumber));
    }).onError((error, stackTrace) {
      setSendOtpLoading(false);
      debugPrint(error.toString());
      Messages.snackBar(context, error.toString());
    });
  }

  bool isOtpCheckLoading = false;

  setOtpCheckLoading(bool val) {
    isOtpCheckLoading = val;
    notifyListeners();
  }

  List<OtpCheckModel> otpCheckList = [];
  bool otpCheckError = false;

  setOtpCheckError(bool val) {
    otpCheckError = val;
    notifyListeners();
  }

  Future<void> otpCheck(BuildContext context, Map<String, dynamic> body) async {
    setOtpCheckLoading(true);
    setOtpCheckError(false);
    otpCheckList.clear();
    _authRepo.checkOTP(body: body).then((value) {
      otpCheckList.add(value);
      if (otpCheckList.first.verify!) {
        setOtpCheckError(false);
        Messages.snackBar(context, otpCheckList.first.message.toString(),
            backgroundColor: AppColors.greenColor);
        // Future.delayed(Duration(microseconds: 200));
        Future.delayed(Duration.zero);
        context.router
            .replace(CreateAccountRoute(phoneNumber: body['phone_number']));
      } else {
        setOtpCheckError(true);
        setOtpCheckLoading(false);
        Messages.snackBar(context, otpCheckList.first.message.toString());
      }
      // notifyListeners();
      // setOtpCheckLoading(false);
    }).onError((error, stackTrace) {
      setOtpCheckError(true);
      setOtpCheckLoading(false);
      Messages.snackBar(context, error.toString());
    });
  }

  // data()async{
  //   var request = http.MultipartRequest(‘POST’, Uri.parse(''));
  //   request.fields[‘ProductId’] = productId.toString();
  //   request.files.add(http.MultipartFile.fromBytes(‘picture’, File(file!.path).readAsBytesSync(),filename: file!.path));
  //   var res = await request.send();
  // }

  signUpOriginal(BuildContext context, body) async {
    // registrationList.clear();
    // setRegistrationLoading(true);
    auth.signUpOriginal(context, body).then((value) {
      // registrationList.add(value);
      Messages.snackBar(context, value.message.toString(),
          backgroundColor: AppColors.greenColor);
      debugPrint(
          "Value: \n\n\n\n\n\n ${value.message} \n ${value.data?.name} \n ${value.patients?.patientFirstName}");
    }).onError((error, stackTrace) {
      debugPrint("Error: \n\n\n\n\n\n $error");
      Messages.snackBar(context, error.toString());
    });
  }

  signUp(BuildContext context, Map<String, String> body, imageBytes) {
    registrationList.clear();
    setRegistrationLoading(true);
    auth.signUpApi(body: body, imageBytes: imageBytes).then((value) {
      registrationList.add(value);
      debugPrint(
          "\n\n\n\n\n\n ${value.patients?.patientFirstName} id: ${value.patients?.id}");
      Messages.snackBar(context, value.message.toString(),
          backgroundColor: AppColors.greenColor);
      // saveUser(
      //     isLoggedIn: true,
      //     email: "${value.patients?.patientEmail}",
      //     password: "password",
      //     name: "${value.patients?.patientFirstName}",
      //     id: int.tryParse("${value.patients?.id}") ?? 0,
      //     role: value.data!.userType ?? "");
      setRegistrationLoading(false);
      // Future.delayed(const Duration(seconds: 1)).then((v) {
      //   // setLoginLoading(false, value);
      //   if (value.data!.userType.toString().toLowerCase() == "patient") {
      context.router.push(const SignInRoute());
      //   } else if (value.data!.userType.toString().toLowerCase() == "doctor") {
      //     context.router.replace(const DoctorHomeRoute());
      //   } else {
      //     Messages.flushBarMessage(context,
      //         "Role is not in the code ${value.data!.userType.toString().toLowerCase()}");
      //   }
      // });
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
      setRegistrationLoading(false);
    });
  }

  List<RegistrationModel> registrationList = [];
  bool isRegistrationLoading = false;

  setRegistrationLoading(bool val) {
    isRegistrationLoading = val;
    notifyListeners();
  }

  AuthRepository auth = AuthRepository();

  Future<void> registration(BuildContext context,
      {required File imageFile,
      required String phoneNumber,
      required String token,
      required String verificationCode,
      required String name,
      required String genderId,
      required String bloodGroupId,
      required String dateOfBirth,
      required String password,
      required String email}) async {
    registrationList.clear();
    setRegistrationLoading(true);
    await auth
        .registration(
            imageFile: imageFile,
            phoneNumber: phoneNumber,
            token: token,
            verificationCode: verificationCode,
            name: name,
            genderId: genderId,
            bloodGroupId: bloodGroupId,
            dateOfBirth: dateOfBirth,
            password: password,
            email: email)
        .then((value) {
      registrationList.add(value);
      Messages.snackBar(context, "Registration Successful",
          backgroundColor: AppColors.greenColor);
      debugPrint(
          "\n---\n---\n---\n---\n---\n---\n---\n---\n id: ${value.patients?.id}---\n Name: ${value.patients?.patientFirstName} \n---\n---\n---\n---\n---\n---\n---\n---\n");
      // saveUser(isLoggedIn: true, email: email, password: password, name: name, id: int.tryParse("${value.patients?.id}") ?? 0);
      setRegistrationLoading(false);
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
      setRegistrationLoading(false);
    });
  }

  saveUser(
      {required bool isLoggedIn,
      required String email,
      required String password,
      required String name,
      required String token,
      required int id,
      required String role}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(UserP.isLoggedIn, isLoggedIn);
    await prefs.setString(UserP.email, email);
    await prefs.setString(UserP.role, role);
    await prefs.setString(UserP.password, password);
    await prefs.setString(UserP.fcmToken, token);
    await prefs.setString(UserP.name, name);
    await prefs.setInt(UserP.id, id);
  }

  removeUser() async {
    final prefs = await SharedPreferences.getInstance();

    // await prefs.remove()
  }

  List<BirthSexModel> birthSexList = [];
  bool isBirthSexLoading = true;

  setBirthSexLoading(bool val) {
    isBirthSexLoading = val;
    notifyListeners();
  }

  List<DropdownMenuItem<BirthSex>> birthSexListItems = [];

  getBirthSex(BuildContext context) async {
    setBirthSexLoading(true);
    birthSexList.clear();
    birthSexListItems.clear();
    await _authRepo.getBirthSex().then((value) {
      print(value);

      birthSexList.add(value);
      birthSexList.first.birthSex!.forEach((element) {
        birthSexListItems.add(DropdownMenuItem(
            child: Text(
          "${element.birthSexName}",
          style: TextStyle(fontSize: 15.sp),
        )));
      });
      setBirthSexLoading(false);
    }).onError((error, stackTrace) {
      setBirthSexLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }

  List<BloodGroupModel> bloodGroupList = [];
  bool isBloodGroupLoading = true;

  setBloodGroupLoading(bool val) {
    isBloodGroupLoading = val;
    notifyListeners();
  }

  List<DropdownMenuItem<BloodGroup>> bloodGroupListItems = [];

  getBloodGroup(BuildContext context) async {
    setBloodGroupLoading(true);
    bloodGroupList.clear();
    bloodGroupListItems.clear();
    await _authRepo.getBloodGroup().then((value) {
      print(value);
      bloodGroupList.add(value);
      bloodGroupList.first.bloodGroup!.forEach((element) {
        bloodGroupListItems.add(DropdownMenuItem(
            child: Text(
          "${element.bloodGroupName}",
          style: TextStyle(fontSize: 15.sp),
        )));
      });
      setBloodGroupLoading(false);
    }).onError((error, stackTrace) {
      setBloodGroupLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }
}
