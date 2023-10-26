import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/profile_qrcode/doctor_profile_model.dart';
import '../../repository/qrcode_profile_repository/doctor_profile.dart';
import '../../view/dr_profile/dr_profile.dart';


class DrProfileViewModel with ChangeNotifier {


  final profilerepo = ProfileRepo();

  List<DoctorProfiles> profileListfull = [];
  List<Doctor> profileList = [];

  bool isProfileLoading = true;

  Future  getProfileData(
    BuildContext context,id
  ) async {
    print("  Prffffffffffffffffffffffffffffffffffffff");
    profileList.clear();
    notifyListeners();
    profilerepo.getProfile(id).then((value) {
      profileListfull.add(value);
      //profileList.addAll(value.doctors as Iterable<Doctor>);
      print("rrrrrrrrrrrrrrrrrr");
      print(value);
      isProfileLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DrProfileView(result: value.doctors)));
      notifyListeners();
    }).onError((error, stackTrace) {
      isProfileLoading = true;
      print("aaaaaaaa"+stackTrace.toString());
      print("aaaaaaaa"+error.toString());
      notifyListeners();
    });
  }
}
