
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:human_body_selector/svg_painter/maps.dart';

import '../../model/anatomy/anatomy_symptoms_model.dart';
import '../../repository/anatomy_repo/anatomy_repo.dart';

const maleFront = 'Male Front';
const maleBack = 'Male Back';
const femaleFront = 'Female Front';
const femaleBack = 'Female Back';

class AnatomyModelView with ChangeNotifier{
  String selectedValue = maleFront;
  String humanFacing = Maps.MALE;

  setSelectedValue(String value){
    selectedValue = value;
    setHumanFacing(selectedValue: selectedValue);

    notifyListeners();
  }

  setHumanFacing({required selectedValue}){
    if(selectedValue == maleBack){
      humanFacing == Maps.MALE1;
      notifyListeners();
    }else if(selectedValue == femaleFront){
      humanFacing == Maps.HUMAN;
      notifyListeners();
    }else if(selectedValue == femaleBack){
      humanFacing == Maps.HUMAN1;
      notifyListeners();
    }else{
      humanFacing == Maps.MALE;
      notifyListeners();
    }

  }

  int flushBarState = 1;

  setFlushBarState(int state){
    flushBarState = state;
    debugPrint("State Change : $state");
    notifyListeners();
  }

  returnBodyFacing(String facing){
    if(facing == maleBack){
      humanFacing == Maps.MALE1;
      // return Maps.MALE1;
    }else if(facing == femaleFront){
      humanFacing == Maps.HUMAN;
      // return Maps.HUMAN;
    } else if(facing == femaleBack){
      humanFacing == Maps.MALE1;
      // return Maps.HUMAN1;
    }else{
      humanFacing == Maps.MALE;
      // return Maps.MALE;
    }
  }

  List<AnatomyModel> anatomySymptomsList = [];

  List<SymptomsAnatomy> symptomsList = [];

  List<SymptomsAnatomy> selectedAnatomyList = [];

  AnatomyRepo anatomyRepo = AnatomyRepo();

  bool isAnatomyLoading = true;

  getAnatomySymptoms(BuildContext context)async{
    isAnatomyLoading = true;
    anatomySymptomsList.clear();
    symptomsList.clear();
    notifyListeners();
    await anatomyRepo.getAnatomySymptoms().then((value) {
      anatomySymptomsList.add(value);
      symptomsList.addAll(value.symptomsAnatomy!);
      isAnatomyLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isAnatomyLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  bool getSymptomsByBodyPartLoading = true;
  List<SymptomsAnatomy> getSymptomsList = [];

   bool getSymptomsByBodyPart({required String name}){

    getSymptomsList = symptomsList.where((element) => element.subBodyPartName?.toLowerCase() == name.toLowerCase()).toList();
    notifyListeners();
    return false;

   }

   selectSymptoms({
    required int index,
     required bool value,
  }){
     // for(var i = 0; i< getSymptomsList.length; i++){
     //
     // }
     getSymptomsList[index].isSelected = value;
     // notifyListeners();
   }
}