import 'package:digi_patient/repository/user_repo/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_detail_model/user_model.dart';
import '../../model/userprofile/userprofile_model.dart';
import '../../utils/user.dart';
import '../../view/profile/patient_profile.dart';

class UserViewModel with ChangeNotifier {
  List<UserProfileModel> userData = [];

  PatientsDetails? user=PatientsDetails();

  UserRepo userRepo = UserRepo();

  bool isUserLoading = true;

  getUserDetails() async {
    userData.clear();
    isUserLoading = true;
    // notifyListeners();
    await userRepo.getUserData().then((value) async {
      userData.add(value);
      user = value.patientsDetails!;
      print(user!.patientBirthSex!.birthSexName.toString());

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
          UserP.gender, user!.patientBirthSex!.birthSexName.toString());
      isUserLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isUserLoading = true;
      notifyListeners();
    });
  }

  editUserData(body,imageBytes,BuildContext context) async {
    isUserLoading = true;
    // notifyListeners();
    await userRepo.signUpApiUpdate( body: body, imageBytes: imageBytes).then((value) async {
      getUserDetails();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileData()));
      isUserLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isUserLoading = true;
      notifyListeners();
    });
  }
  editUserDataNoImage(body,BuildContext context) async {
    isUserLoading = true;
    // notifyListeners();
    await userRepo.editUserData(  body).then((value) async {
      getUserDetails();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileData()));
      isUserLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isUserLoading = true;
      notifyListeners();
    });
  }
}
