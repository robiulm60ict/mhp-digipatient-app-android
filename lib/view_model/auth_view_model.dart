import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../login_service.dart';
import '../model/auth_model/RegistrationModel.dart';
import '../model/auth_model/birth_sex_model.dart';
import '../model/auth_model/blood_group_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '../resources/colors.dart';
import '../utils/route/routes_name.dart';
import '../utils/user.dart';
import '../view/authentications/create_account_view.dart';
import '../view/authentications/sign_in_view.dart';
import '../view/forget_password/forget_pincode_verification_view.dart';
import '../view/forget_password/newpassword_view.dart';
import '../view/pincode_verification_view.dart';
import '/repository/auth_repository.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

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
    notifyListeners();
  }

  bool isLoginLoading = false;

  setSignupLoading(
    bool value,
  ) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic body,
      {bool keepMeSignIn = true}) async {
    setLoginLoading(true);
    isLoginLoading = true;
    notifyListeners();
    _authRepo.loginApi(body).then((value) async {
      print(value);
      if (value['message'] == 'User Logged in sucessfully') {
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
        currentUser.name = value["user"]['name'].toString();
        print("cccccccccccccccccccccc${value["user"]['name'].toString()}");
        login(
          userID: int.parse(value["user"]['user_id']).toString(),
          userName: value["user"]['name'].toString(),
        ).then((value) {
          onUserLogin();
          setLoginLoading(false);
          isLoginLoading = false;
          // notifyListeners();

          Navigator.pushNamed(context, RoutesName.dashbord);
          // onUserLogin();
        });
        // currentUser.id =  int.parse(value["user"]['user_id']).toString();

        // Future.delayed(const Duration(seconds: 0)).then((v) {
        //   setLoginLoading(false);
        //   isLoginLoading = false;
        //   // notifyListeners();
        //   // Navigator.pushNamed(
        //   //   context,
        //   //   PageRouteNames.home,
        //   // );
        //   Navigator.pushNamed(context, RoutesName.dashbord);
        //   onUserLogin();
        // });
      } else {
        Messages.flushBarMessage(context, '${value['message']}',
            backgroundColor: AppColors.redColor);
        setLoginLoading(false);
        isLoginLoading = false;
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Messages.flushBarMessage(context, error.toString());
      setLoginLoading(false);
      isLoginLoading = false;
    });
  }

  /// on App's user login
  // void onUserLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? userid = prefs.getInt(UserP.id);
  //   String? name = prefs.getString(UserP.name);
  //
  //   print(userid);
  //
  //   /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
  //   /// when app's user is logged in or re-logged in
  //   /// We recommend calling this method as soon as the user logs in to your app.
  //
  //   ZegoUIKitPrebuiltCallInvitationService().init(
  //     ringtoneConfig: ZegoRingtoneConfig(),
  //     uiConfig: ZegoCallInvitationUIConfig(
  //       callingBackgroundBuilder: (
  //         BuildContext context,
  //         Size size,
  //         ZegoCallingBackgroundBuilderInfo info,
  //       ) {
  //         return Container(
  //           width: size.width,
  //           height: size.height,
  //           decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5)),
  //           child: Center(
  //             child: Text(
  //               'inviter:${info.inviter.name}, invitees:${info.invitees.map((e) => '${e.name},')}',
  //               style: const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 12,
  //                 decoration: TextDecoration.none,
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //     // notificationConfig: ZegoCallInvitationNotificationConfig(
  //     //   androidNotificationConfig: ZegoAndroidNotificationConfig(
  //     //       callIDVisibility: true,
  //     //     vibrate: true
  //     //   ),
  //     //   iOSNotificationConfig: ZegoIOSNotificationConfig(
  //     //     appName: '',
  //     //
  //     //     certificateIndex:
  //     //     ZegoSignalingPluginMultiCertificate.firstCertificate,
  //     //   ),
  //     // ),
  //     appID: 1293432009 /*input your AppID*/,
  //     appSign:
  //         "ce9d090d86cd6d51344033934af611515fdb0fc5760cfd02df1f99c06b0b94cf" /*input your AppSign*/,
  //     userID: userid.toString(),
  //     userName: name.toString(),
  //     plugins: [ZegoUIKitSignalingPlugin()],
  //     requireConfig: (ZegoCallInvitationData data) {
  //       var config = (data.invitees.length > 1)
  //           ? ZegoCallType.videoCall == data.type
  //               ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
  //               : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
  //           : ZegoCallType.videoCall == data.type
  //               ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
  //               : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
  //
  //       /// show minimizing button
  //       config.topMenuBarConfig.isVisible = true;
  //       // config.layout=ZegoLayout.gallery(
  //       //   showNewScreenSharingViewInFullscreenMode: true,
  //       //       // showScreenSharingFullscreenModeToggleButtonRules: ZegoShowFullscreenModeToggleButtonRules.showWhenScreenPressed,
  //       // );
  //
  //       config.bottomMenuBarConfig.buttons
  //           .insert(3, ZegoMenuBarButtonName.minimizingButton);
  //       // config.topMenuBarConfig.buttons
  //       //     .insert(0, ZegoMenuBarButtonName.toggleCameraButton);
  //
  //       return config;
  //     },
  //   );
  // }

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
      print(value);
      if (value['message'].toString() ==
          "Verification code sent successfully") {
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PinCodeVerificationView(
                      phoneNumber: phnNumber,
                      token: value['token'],
                    )));
      } else if (value['message'].toString() == "The given data was invalid.") {
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
        Messages.snackBar(context, value['errors']['phone_number'].toString());
      } else {
        Messages.snackBar(context, value['message'].toString());
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
      }

      // otpList.add(value);

      // context.router.push(PinCodeVerificationRoute(phoneNumber: phnNumber));
    }).onError((error, stackTrace) {
      isSendOtpLoading = false;
      notifyListeners();
      setSendOtpLoading(false);
      debugPrint(error.toString());
      Messages.snackBar(context, error.toString());
    });
  }

  Future<void> logout(id) async {
    Map<String, dynamic> body = {"id": id.toString()};
    setSendOtpLoading(true);
    isSendOtpLoading = true;
    notifyListeners();
    otpList.clear();
    await _authRepo.logoutApi(body: body).then((value) {
      print(value);

      // otpList.add(value);

      // context.router.push(PinCodeVerificationRoute(phoneNumber: phnNumber));
    }).onError((error, stackTrace) {
      isSendOtpLoading = false;
      notifyListeners();

    });
  }

  Future<void> sendOtpForget(BuildContext context,
      {required String phnNumber}) async {
    Map<String, dynamic> body = {"phone_number": phnNumber};
    setSendOtpLoading(true);
    isSendOtpLoading = true;
    notifyListeners();
    otpList.clear();
    await _authRepo.sendOTPForget(body: body).then((value) {
      print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      print(value);
      if (value['message'].toString() ==
          "Verification code sent successfully") {
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ForgetPinCodeVerificationView(
                      phoneNumber: phnNumber,
                      token: value['token'],
                    )));
      } else if (value['message'].toString() == "The given data was invalid.") {
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
        Messages.snackBar(context, value['errors']['phone_number'].toString());
      } else {
        Messages.snackBar(context, value['message'].toString());
        setSendOtpLoading(false);
        isSendOtpLoading = false;

        notifyListeners();
      }

      // otpList.add(value);

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
        Navigator.pushReplacement(
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

  Future<void> otpCheckForget(
      BuildContext context, Map<String, dynamic> body) async {
    print("dddddddddddddddddddddddddddddddd");
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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NewPasswordSendView(
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

  Future<void> newpasswordForget(
      BuildContext context, Map<String, dynamic> body) async {
    setOtpCheckLoading(true);
    setOtpCheckError(false);
    _authRepo.newPassword(body: body).then((value) {
      print(value);
      // if (otpCheckList.first.verify!) {
      //   setOtpCheckError(false);

      Messages.snackBar(context, "${value['message'].toString()}",
          backgroundColor: AppColors.greenColor);
      //   // Future.delayed(Duration(microseconds: 200));
      //   Future.delayed(Duration.zero);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInView()));
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>
      //               NewPasswordSendView(phoneNumber: body['phone_number'],)));
      //
      //
      //   // context.router
      //   //     .push(CreateAccountRoute(phoneNumber: body['phone_number']));
      // } else {
      //   setOtpCheckError(true);
      //   setOtpCheckLoading(false);
      //   Messages.snackBar(context, otpCheckList.first.message.toString());
      // }
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
      print(error.toString());
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
  List<BirthSex> birthSexListsingle = [];
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
    birthSexListsingle.clear();
    // notifyListeners();
    await _authRepo.getBirthSex().then((value) {
      print('dddddddddddddddddddddd${value}');
      setBirthSexLoading(false);

      birthSexList.add(value);
      birthSexListsingle.addAll(value.birthSex as Iterable<BirthSex>);

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
  List<BloodGroups> bloodGroupListsoingle = [];
  bool isBloodGroupLoading = true;

  setBloodGroupLoading(bool val) {
    isBloodGroupLoading = val;
    notifyListeners();
  }

  List<DropdownMenuItem<BloodGroups>> bloodGroupListItems = [];

  getBloodGroup(BuildContext context) async {
    setBloodGroupLoading(true);
    bloodGroupList.clear();
    bloodGroupListItems.clear();
    bloodGroupListsoingle.clear();
    await _authRepo.getBloodGroup().then((value) {
      print(value);
      bloodGroupList.add(value);
      bloodGroupListsoingle.addAll(value.bloodGroup as Iterable<BloodGroups>);
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
