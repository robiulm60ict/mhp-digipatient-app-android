import 'package:digi_patient/repository/user_repo/user_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../model/user_detail_model/user_model.dart';
import '../../model/userprofile/userprofile_model.dart';

class UserViewModel with ChangeNotifier{

  List<UserProfileModel> userData = [];

  PatientsDetails? user;

  UserRepo userRepo = UserRepo();

  bool isUserLoading = true;



  getUserDetails()async{
    userData.clear();
    isUserLoading=true;
    // notifyListeners();
    await userRepo.getUserData().then((value) {
      userData.add(value);
      user = value.patientsDetails!;
      isUserLoading=false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isUserLoading=true;
      notifyListeners();
    });
  }

}