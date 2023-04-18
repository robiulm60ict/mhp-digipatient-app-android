import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';

import '../../model/my_record_model/medical_history_from_great_doc_model.dart';
import '../../repository/my_record_repo/my_record_repo.dart';

class MyRecordViewModel with ChangeNotifier{

  List<MedicalHistoryFromGreatDocModel> medicalHistoryFromGreatDocList = [];
  List<PastHistory> medicalHistoryFromGreatDocPastList = [];

  bool isMedicalHistoryFromGreatDocLoading = true;

  MyRecordRepo myRecordRepo = MyRecordRepo();

  getMedicalHistoryFromGreatDoc(BuildContext context)async{
    medicalHistoryFromGreatDocList.clear();
    medicalHistoryFromGreatDocPastList.clear();
    isMedicalHistoryFromGreatDocLoading = true;
    notifyListeners();
    await myRecordRepo.getMedicalHistoryFromGreatDoc().then((value) {
      medicalHistoryFromGreatDocList.add(value);
      medicalHistoryFromGreatDocPastList.addAll(value.pastHistory!);
      isMedicalHistoryFromGreatDocLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isMedicalHistoryFromGreatDocLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }
}