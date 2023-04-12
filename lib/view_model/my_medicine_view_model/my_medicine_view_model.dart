
import 'package:digi_patient/model/my_medicine_model/current_rx_model.dart';
import 'package:digi_patient/model/my_medicine_model/past_rx_model.dart';
import 'package:digi_patient/repository/my_medicine_repo/my_medicine_repo.dart';
import 'package:flutter/cupertino.dart';

class MyMedicineViewModel with ChangeNotifier{

  final medicineRepo = MyMedicineRepo();

  List<CurrentRxModel> currentRxList = [];

  List<PastRxModel> pastRxList = [];

  List<Drugs> drugList = [];

  bool isCurrentRxLoading = true;

  getCurrentRx(BuildContext context)async{
    currentRxList.clear();
    drugList.clear();
    medicineRepo.getCurrentRX().then((value) {
      currentRxList.add(value);
      drugList.addAll(value.drugs!);
      isCurrentRxLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isCurrentRxLoading = true;
      notifyListeners();
    });
  }

  getPastRx(BuildContext context)async{
    isCurrentRxLoading = true;
    pastRxList.clear();
    drugList.clear();
    medicineRepo.getPastRX().then((value) {
      pastRxList.add(value);
      drugList.addAll(value.drugs!);
      isCurrentRxLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isCurrentRxLoading = true;
      notifyListeners();
    });
  }
}