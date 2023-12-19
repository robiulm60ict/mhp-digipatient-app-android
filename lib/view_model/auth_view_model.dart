import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:digi_patient/view/authentications/create_account_view.dart';
import 'package:digi_patient/view/pincode_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/auth_model/RegistrationModel.dart';
import '../model/auth_model/birth_sex_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '../repository/doctor_screen_repo/patient_list_repo.dart';
import '../utils/route/routes_name.dart';
import '../view/authentications/sign_in_view.dart';
import '/repository/auth_repository.dart';
import '/routes/routes.gr.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '/utils/message.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loginLoading = false;
  bool _signupLoading = false;

  bool get loginLoading => _loginLoading;


  // UserViewModel userViewModel = UserViewModel();
  //TODO: Add user view model

  setLoginLoading(bool value) {
    _loginLoading = value;
   // user = val;
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
    setLoginLoading(true);
    _authRepo.loginApi(body).then((value) async {
      if(value['message']=='User Logged in sucessfully'){
        Messages.flushBarMessage(context, '${value['message']}',
            backgroundColor: AppColors.primaryColor);
        await saveUser(
            isLoggedIn: keepMeSignIn,
            email: body['email'],
            password: body['password'],
            name: value["user"]['name'],
            id: int.parse(value["user"]['user_id']),
            userid: int.parse(value["user"]['id'].toString()),
            role: value["user"]['user_type'] ?? "",
            token: value['token'].toString());

        Future.delayed(const Duration(seconds: 1)).then((v) {
          setLoginLoading(false);

          Navigator.pushNamed(context, RoutesName.dashbord);
          onUserLogin();
        });
      }else{
        Messages.flushBarMessage(context, '${value['message']}',
            backgroundColor: AppColors.redColor);
        setLoginLoading(false);

      }




    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Messages.flushBarMessage(context, error.toString());
      setLoginLoading(false);
    });
  }

  /// on App's user login
  void onUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt(UserP.id);
    String? name = prefs.getString(UserP.name);

    print(userid);

    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    final callController = ZegoUIKitPrebuiltCallController();

    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 1293432009 /*input your AppID*/,
      appSign:
          "ce9d090d86cd6d51344033934af611515fdb0fc5760cfd02df1f99c06b0b94cf" /*input your AppSign*/,
      userID: userid.toString(),
      userName: name.toString(),
      notifyWhenAppRunningInBackgroundOrQuit: true,
      androidNotificationConfig: ZegoAndroidNotificationConfig(
        channelID: "ZegoUIKit",
        channelName: "Call Notifications",
        sound: "notification",
      ),
      controller: callController,
      showCancelInvitationButton: true,
      showDeclineButton: true,
      appName: "Digi Patient",
      ringtoneConfig: ZegoRingtoneConfig(),
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
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
    isSendOtpLoading = true;
    notifyListeners();
    otpList.clear();
    await _authRepo.sendOTP(body: body).then((value) {

      if(value.message.toString()=="Verification code sent successfully"){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PinCodeVerificationView(phoneNumber: phnNumber)));
      }

      otpList.add(value);

      setSendOtpLoading(false);
      isSendOtpLoading = false;

      notifyListeners();
      // context.router.push(PinCodeVerificationRoute(phoneNumber: phnNumber));
    }).onError((error, stackTrace) {
      isSendOtpLoading = false;
      notifyListeners();
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateAccountView(
                      phoneNumber: body['phone_number'],
                    )));

        // context.router
        //     .push(CreateAccountRoute(phoneNumber: body['phone_number']));
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
    isRegistrationLoading = true;
    notifyListeners();
    auth.signUpApi(body: body, imageBytes: imageBytes).then((value) {
      if (value['message'] == "User Registration Completed") {
        Messages.snackBar(context, value['message'].toString(),
            backgroundColor: AppColors.greenColor);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInView()));
      } else if (value['status'] == 400) {
        Messages.snackBar(context, value['msg'].toString(),
            backgroundColor: AppColors.redColor);
      } else {
        Messages.snackBar(context, value.toString(),
            backgroundColor: AppColors.redColor);
      }

      isRegistrationLoading = false;

      notifyListeners();
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
      setRegistrationLoading(false);
      isRegistrationLoading = false;
      notifyListeners();
    });
  }

  List<RegistrationModel> registrationList = [];
  bool isRegistrationLoading = false;

  setRegistrationLoading(bool val) {
    isRegistrationLoading = val;
    notifyListeners();
  }

  AuthRepository auth = AuthRepository();

  saveUser(
      {required bool isLoggedIn,
      required String email,
      required String password,
      required String name,
      required String token,
      required int id,
      required int userid,
      required String role}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(UserP.isLoggedIn, isLoggedIn);
    await prefs.setString(UserP.email, email);
    await prefs.setString(UserP.role, role);
    await prefs.setString(UserP.password, password);
    await prefs.setString(UserP.fcmToken, token);
    await prefs.setString(UserP.name, name);
    await prefs.setInt(UserP.id, id);
    await prefs.setInt(UserP.userid, userid);
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
