import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/clinic/orgamozationlist_model.dart';
import '../../../model/clinic/patientid_brance.dart';
import '../../../repository/my_clinic_repository/my_Clinic_repo.dart';
import '../../../utils/message.dart';
import '../../../utils/user.dart';

class MyClinicViewModel with ChangeNotifier {
  final myRepo = MyClinicRepo();
  TextEditingController controllerRequest = TextEditingController();

  clinicRequest(BuildContext context, orId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    Map body = {"code": "OC-${orId.toString()}", "patient_id": id.toString()};
    print(body);
    await myRepo.postclinicRequest(body).then((value) {
      print(value);
      print("postclinicRequest");
      getoriganization(context);
      controllerRequest.clear();

      // if (value['message'].toString() == "Successfully store data") {
      //   Messages.snackBar(context, value['message'].toString(),
      //       backgroundColor: Colors.green);
      //
      // } else {
      //   Messages.snackBar(context, value['message'].toString());
      // }

      notifyListeners();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    });

    notifyListeners();
  }

  deactiveDoctors(BuildContext context, id, states) async {
    notifyListeners();
    await myRepo.deactiveclinice(id, states).then((value) {
      // getmyAllDoctors(context);
      // getmyAllDeactiveDoctors(context);
      getoriganizationdeactive(context);
      getoriganization(context);
      notifyListeners();
    }).onError((error, stackTrace) {
      // isDoctorLoading = true;
    });

    notifyListeners();
  }

  copypateitnpostclinicRequest(
      BuildContext context, dbName, saas_branch_id, saas_branch_name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    Map body = {
      "paitentId": id.toString(),
      "dbName": dbName.toString(),
      "saas_branch_id": saas_branch_id.toString(),
      "saas_branch_name": saas_branch_name.toString()
    };
    print(body);
    await myRepo.copypateitnpostclinicRequest(body).then((value) {
      print(value);

      notifyListeners();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    });

    notifyListeners();
  }

  PatientBranceIdModel? patientBranceIdModel;

  pateitnIdGETpostclinicRequest(BuildContext context, dbName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? hn = prefs.getString(UserP.hnnumber);
    Map body = {
      "patient_hn_number": hn.toString(),
      "dbName": dbName.toString(),
    };
    print(body);
    await myRepo.pateitnIdGETpostclinicRequest(body).then((value) {
      print(value);
      patientBranceIdModel = value;

      notifyListeners();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    });

    notifyListeners();
  }

  List<OrganizationListModle> organizationlistmodel = [];

  bool isorgaizationLoading = true;

  getoriganization(BuildContext context) async {
    organizationlistmodel.clear();

    isorgaizationLoading = true;

    notifyListeners();
    await myRepo.getoriganization(context).then((value) {
      organizationlistmodel = value;

      isorgaizationLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isorgaizationLoading = true;
      debugPrint(error.toString());
      print(stackTrace);

      Messages.snackBar(
        context,
        error.toString(),
      );
    });

    notifyListeners();
  }

  List<OrganizationListModle> organizationlistmodeldeactive = [];

  bool isorgaizationLoadingdeactive = true;

  getoriganizationdeactive(BuildContext context) async {
    organizationlistmodeldeactive.clear();

    isorgaizationLoadingdeactive = true;

    notifyListeners();
    await myRepo.getoriganizationdeactive(context).then((value) {
      organizationlistmodeldeactive = value;

      isorgaizationLoadingdeactive = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isorgaizationLoadingdeactive = true;
      debugPrint(error.toString());
      print(stackTrace);

      Messages.snackBar(
        context,
        error.toString(),
      );
    });

    notifyListeners();
  }
}
