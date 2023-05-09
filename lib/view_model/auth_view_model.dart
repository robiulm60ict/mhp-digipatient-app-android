import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/repository/auth_repository.dart';
import '/routes/routes.gr.dart';
import '/utils/message.dart';

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

  Future<void> signUpApi(BuildContext context, dynamic body) async{
    setSignupLoading(true);
    _authRepo.signUpApi(body).then((value) {
      Messages.flushBarMessage(context, 'Signup Successful $value');
      // userViewModel.saveUser(value.token);
      setSignupLoading(false);
      context.router.replace(const DashboardRoute());
    }).onError((error, stackTrace) {
      Messages.flushBarMessage(context, error.toString());
      setSignupLoading(false);
    });
  }

  saveUser({required bool isLoggedIn, required String email, required String password, required String name, required int id}) async{
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(UserP.isLoggedIn, isLoggedIn);
    await prefs.setString(UserP.email, email);
    await prefs.setString(UserP.password, password);
    await prefs.setString(UserP.name, name);
    await prefs.setInt(UserP.id, id);
  }

  removeUser()async{

    final prefs = await SharedPreferences.getInstance();

    // await prefs.remove()

  }
}
