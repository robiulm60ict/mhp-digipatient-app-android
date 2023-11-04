import 'package:digi_patient/repository/user_repo/user_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../model/user_detail_model/user_model.dart';
import '../../model/userprofile/userprofile_model.dart';

class UserViewModel with ChangeNotifier{

  List<UserProfileModel> userData = [];

  PatientsDetails? user;

  UserRepo userRepo = UserRepo();

  bool isUserLoading = true;

  setUserLoading(bool val){
    isUserLoading = val;
    notifyListeners();
  }

  getUserDetails()async{
    userData.clear();
    await userRepo.getUserData().then((value) {
      print(value.toString());
      userData.add(value);
      user = value.patientsDetails!;
      setUserLoading(false);
      notifyListeners();
    }).onError((error, stackTrace) {
      setUserLoading(true);
      notifyListeners();
    });
  }

}