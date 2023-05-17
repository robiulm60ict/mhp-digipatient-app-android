import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/auth_model/birth_sex_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '../resources/send_image.dart';
import '/repository/auth_repository.dart';
import '/routes/routes.gr.dart';
import '/utils/message.dart';
import 'package:http/http.dart' as http;

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loginLoading = false;
  bool _signupLoading = false;
  bool get loginLoading => _loginLoading;
  bool get signupLoading => _signupLoading;

  // UserViewModel userViewModel = UserViewModel();
  //TODO: Add user view model

  setLoginLoading(bool value,  LoginModel? val){
    _loginLoading = value;
    user = val;
    notifyListeners();
  }

  setSignupLoading(bool value,){
    _signupLoading = value;
    notifyListeners();
  }

  LoginModel? user;

  Future<void> loginApi(BuildContext context, dynamic body, {bool keepMeSignIn = true}) async{
    setLoginLoading(true, null);
    _authRepo.loginApi(body).then((value) async{
      Messages.flushBarMessage(context, '${value.message}',backgroundColor: AppColors.primaryColor);
      await saveUser(isLoggedIn: keepMeSignIn, email: body['email'], password: body['password'], name: value.user!.name!, id: int.parse(value.user!.userId!));
       Future.delayed(const Duration(seconds: 2)).then((value) {
         setLoginLoading(false, value);
         context.router.replace(const DashboardRoute());
       });

    }).onError((error, stackTrace) {
      debugPrint(error.toString());
        Messages.flushBarMessage(context, error.toString());
    setLoginLoading(false, null);
    });
  }

  bool isSendOtpLoading = false;
  setSendOtpLoading(bool val){
    isSendOtpLoading = val;
    notifyListeners();
  }
  List<SendVerificationModel> otpList = [];

  Future<void> sendOtp(BuildContext context, {required String phnNumber}) async{
    Map<String, dynamic> body = {
      "phone_number" : phnNumber
    };
    setSendOtpLoading(true);
    otpList.clear();
    await _authRepo.sendOTP(body: body).then((value) {

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
  setOtpCheckLoading(bool val){
    isOtpCheckLoading = val;
    notifyListeners();
  }
  List<OtpCheckModel> otpCheckList = [];
  bool otpCheckError = false;
  setOtpCheckError(bool val){
    otpCheckError = val;
    notifyListeners();
  }

  Future<void> otpCheck(BuildContext context, Map<String, dynamic> body)async{
    setOtpCheckLoading(true);
    setOtpCheckError(false);
    otpCheckList.clear();
    _authRepo.checkOTP(body: body).then((value) {
      otpCheckList.add(value);
        if(otpCheckList.first.verify!){
          setOtpCheckError(false);
          Messages.snackBar(context, otpCheckList.first.message.toString(), backgroundColor: AppColors.greenColor);
          // Future.delayed(Duration(microseconds: 200));
          Future.delayed(Duration.zero);
          context.router.replace( CreateAccountRoute(phoneNumber: body['verification_code'], token: body['token'], vCode: body["phone_number"]));
        }else{
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
  SendImage sendImage = SendImage();
  Future<void> signUpAndSendImage(BuildContext context, {required Map<String,String> body, required String filePath, bool keepMeSignIn = true,})async{
    setSignupLoading(true);
    await sendImage.addImage(body, filePath).then((value) async{
      if(value) {
        setSignupLoading(false,);
        // await saveUser(isLoggedIn: keepMeSignIn, email: body['email'], password: body['password'], name: value.patients!.patientFirstName!, id: int.parse("${value.patients!.id!}"));

      Messages.flushBarMessage(context, "Sign UP Successful",backgroundColor: Colors.green);
        // context.router.replace(const DashboardRoute());
      }else{
        Messages.flushBarMessage(context, "Something Went Wrong Please try again");
        setSignupLoading(false,);
      }
    }).onError((error, stackTrace) {
      Messages.flushBarMessage(context, error.toString());
      setSignupLoading(false);
    });
  }
  Future<void> signUpApi(BuildContext context, Map<String,dynamic> body, {bool keepMeSignIn = true}) async{
    setSignupLoading(true);
    _authRepo.signUpApi( body: body).then((value) async {
      Messages.flushBarMessage(context, 'Signup Successful ${value.message}');
      // userViewModel.saveUser(value.token);
      await saveUser(isLoggedIn: keepMeSignIn, email: body['email'], password: body['password'], name: value.patients!.patientFirstName!, id: int.parse("${value.patients!.id!}"));
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setSignupLoading(false,);
      context.router.replace(const DashboardRoute());
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Messages.flushBarMessage(context, error.toString());
      setSignupLoading(false);
    });
  }

  saveUser({required bool isLoggedIn, required String email, required String password, required String name, required int id}) async{
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(UserP.isLoggedIn, isLoggedIn);
    await prefs.setString(UserP.email, email);
    // await prefs.setString(UserP.phone, email);
    await prefs.setString(UserP.password, password);
    await prefs.setString(UserP.name, name);
    await prefs.setInt(UserP.id, id);
  }

  removeUser()async{

    final prefs = await SharedPreferences.getInstance();

    // await prefs.remove()

  }

  List<BirthSexModel> birthSexList = [];
  bool isBirthSexLoading = true;
  setBirthSexLoading(bool val){
    isBirthSexLoading = val;
    notifyListeners();
  }

  List<DropdownMenuItem<BirthSex>> birthSexListItems = [];

  getBirthSex(BuildContext context) async{
    setBirthSexLoading(true);
    birthSexList.clear();
    birthSexListItems.clear();
    await _authRepo.getBirthSex().then((value) {
      birthSexList.add(value);
      birthSexList.first.birthSex!.forEach((element) {birthSexListItems.add(DropdownMenuItem(child: Text("${element.birthSexName}", style: TextStyle(fontSize: 15.sp),))); });
      setBirthSexLoading(false);
    }).onError((error, stackTrace) {
      setBirthSexLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }


  List<BloodGroupModel> bloodGroupList = [];
  bool isBloodGroupLoading = true;
  setBloodGroupLoading(bool val){
    isBloodGroupLoading = val;
    notifyListeners();
  }

  List<DropdownMenuItem<BloodGroup>> bloodGroupListItems = [];

  getBloodGroup(BuildContext context) async{
    setBloodGroupLoading(true);
    bloodGroupList.clear();
    bloodGroupListItems.clear();
    await _authRepo.getBloodGroup().then((value) {
      bloodGroupList.add(value);
      bloodGroupList.first.bloodGroup!.forEach((element) {
        bloodGroupListItems.add(DropdownMenuItem(child: Text("${element.bloodGroupName}", style: TextStyle(fontSize: 15.sp),)));
      });
      setBloodGroupLoading(false);
    }).onError((error, stackTrace) {
      setBloodGroupLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }

}
