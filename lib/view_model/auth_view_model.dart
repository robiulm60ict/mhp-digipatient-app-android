import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '/repository/auth_repository.dart';
import '/routes/routes.gr.dart';
import '/utils/message.dart';
// import '/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loginLoading = false;
  bool _signupLoading = false;
  bool get loginLoading => _loginLoading;
  bool get signupLoading => _signupLoading;

  // UserViewModel userViewModel = UserViewModel();
  //TODO: Add user view model

  setLoginLoading(bool value){
    _loginLoading = value;
    notifyListeners();
  }

  setSignupLoading(bool value){
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic body) async{
    setLoginLoading(true);
    _authRepo.loginApi(body).then((value) {
      debugPrint(value);
      Messages.flushBarMessage(context, 'Login Successful', durationSecond: 10);
      setLoginLoading(false);
      context.router.replace(const DashboardRoute());
    }).onError((error, stackTrace) {
        Messages.flushBarMessage(context, error.toString());
    setLoginLoading(false);
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
}
