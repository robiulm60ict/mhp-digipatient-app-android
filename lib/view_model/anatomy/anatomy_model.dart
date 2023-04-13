
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:human_body_selector/svg_painter/maps.dart';

import '../../model/anatomy/anatomy_symptoms.dart';
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

  List<AnatomySymptoms> anatomySymptomsList = [];

  List<SymptomsAnatomy> symptomsList = [];

  AnatomyRepo anatomyRepo = AnatomyRepo();

  getAnatomySymptoms(BuildContext context)async{
    anatomySymptomsList.clear();
    symptomsList.clear();
    await anatomyRepo.getAnatomySymptoms().then((value) {
      anatomySymptomsList.add(value);
      symptomsList.addAll(value.symptomsAnatomy!);
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
    });
  }

}