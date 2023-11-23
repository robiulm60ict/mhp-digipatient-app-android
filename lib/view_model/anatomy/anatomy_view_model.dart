
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

  //List<AnatomyModel> anatomySymptomsList = [];

  List<SymptomsAnatomy> symptomsList = [];

  List<SymptomsAnatomy> selectedAnatomyList = [];

  AnatomyRepo anatomyRepo = AnatomyRepo();

  bool isAnatomyLoading = true;
  String anatomyStatus = "Loading.....";
  setAnatomyLoading(bool val, String status){
    isAnatomyLoading = val;
    anatomyStatus = status;
    notifyListeners();
  }


  getAnatomySymptoms(BuildContext context)async{
    setAnatomyLoading(true, "Loading......");
    //anatomySymptomsList.clear();
    symptomsList.clear();

    await anatomyRepo.getAnatomySymptoms().then((value) {
    //  anatomySymptomsList.add(value);
      symptomsList.addAll(value.symptomsAnatomy!);
      setAnatomyLoading(false, "Successful");
      // for(var i in symptomsList){
      //   debugPrint("SymptomName: ${i.symptomName} Selected: ${i.isSelected}");
      // }
    }).onError((error, stackTrace) {
      setAnatomyLoading(true, "Error Try Again Later......");
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  bool getSymptomsByBodyPartLoading = true;
  List<SymptomsAnatomy> getSymptomsList = [];
  // List<SymptomsAnatomy> selectedAnatomyList = [];

   bool getSymptomsByBodyPart({required String name}){
// symptomsList = symptomsList.where((e) => e.subBodyPartName?.contains(name) ?? false || e.mainBodyPartName?.contains(name) ?? false).toList();
    getSymptomsList = symptomsList.where((element) => element.subBodyPartName?.toLowerCase() == name.toLowerCase() || element.mainBodyPartName?.toLowerCase() == name.toLowerCase()).toList();
    // notifyListeners();
    return false;

   }
  List selecteddata = [];

   List<SymptomsAnatomy> getSelectedSymptomsList({bool setEmpty = false}){
     List<SymptomsAnatomy> selected = [];

     if(setEmpty){
       return <SymptomsAnatomy>[];
     }
     for(var i in getSymptomsList){
      // debugPrint("\nSelected: ${i.symptomName} ${i.isSelected}");
       if(i.isSelected!= null && i.isSelected == true){
         selected.add(i);
         selecteddata.add(i.symptomName);
       //   print(selected.first.symptomName);
       //   // print(selecteddata.reversed.first.symptomName);
       // debugPrint("Added --");

       }else{
       //  debugPrint("denied --");
       }
     }


     // notifyListeners();
     return selected;
   }

   selectSymptoms({
    required int index,
     required bool value,
  }){

     getSymptomsList[index].isSelected = value;
     // notifyListeners();
    //  if(value){
    //    selectedAnatomyList.add(getSymptomsList[index]);
    //  }else{
    //    selectedAnatomyList.remove(getSymptomsList[index]);
    //  }
    // bool contain =  selectedAnatomyList.contains(getSymptomsList[index]);
    //  if(contain){
    //    selectedAnatomyList.remove(getSymptomsList[index]);
    //    for(var i in selectedAnatomyList){
    //      debugPrint(i.symptomName);
    //    }
    //  }else{
    //
    //  }
     notifyListeners();
    // debugPrint("\n\n\n value is = $value ---Does contain? ${getSymptomsList[index].symptomName} =$contain");

   }

//    selectSymtoms2({required int index, required bool value}){
//      symptomsList[index].isSelected = value;
// notifyListeners();
//    }
}