import 'package:flutter/cupertino.dart';

import '../../model/communication/communication_model.dart';

class CommunicationViewModel with ChangeNotifier{
  List<CommunicationModel> searchResult = [];
  List<CommunicationModel> communicationModelList = [
    CommunicationModel(userName: "Habib", message: "Hey, What are you doing?", userImage: ''),
    CommunicationModel(userName: "Tanxir Ahmad Tushar", message: "Where is the update?", userImage: ''),
    CommunicationModel(userName: "Adib Ahmad", message: "You are late!", userImage: ''),
    CommunicationModel(userName: "Sandy", message: "You are happy inside but not showing us!", userImage: ''),
    CommunicationModel(userName: "Arafat", message: "You can do it", userImage: ''),
    CommunicationModel(userName: "Hernandez", message: "I like Neymar but support Argentina", userImage: ''),
    CommunicationModel(userName: "Emran", message: "... Yes. you have to understand", userImage: ''),
    CommunicationModel(userName: "Tahir", message: "no no no. I know this. it's simple!", userImage: ''),
    // CommunicationModel(userName: "", message: "", userImage: ''),
  ];

  getCommunicationData(){
    // TODO: Api Call

  }
  addUser(CommunicationModel userDetail){
    searchResult.add(userDetail);
    notifyListeners();
  }
  // search(String text){
  //   // if(text.isNotEmpty){
  //   //
  //   // }
  //   for (var userDetail in communicationModelList) {
  //     if (userDetail.userName.contains(text)) {
  //       searchResult.add(userDetail);
  //       notifyListeners();
  //     }
  //   }
  // }

}