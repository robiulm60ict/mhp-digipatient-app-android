
import 'package:digi_patient/utils/datetime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/online_model/online_model.dart';

class AppointmentViewModel with ChangeNotifier{

  DateTime appointmentDate = DateTime.now();

  String monthName = DateFormat('MMMM').format(DateTime.now());

  String year = DateTime.now().year.toString();

  List<WeekDayModel> weekDayList = [];

  setAppointmentDate(BuildContext context) async{

    DateTime? selectedDate = await PickDateTime().pickDate(context, initialDate: appointmentDate);

    if(selectedDate != null){

      appointmentDate = selectedDate;

      DateTime startWeekDay = getDate(appointmentDate.subtract(Duration(days: appointmentDate.weekday - 1)));

      // startWeekDay = startWeekDay.subtract(const Duration(days: 2));

      weekDayList.clear();

      for(var i = 0; i<7; i++){

        DateTime date = startWeekDay.add(Duration(days: i));

        weekDayList.add(WeekDayModel(weekName: DateFormat("EEEE").format(date).substring(0,3), isSelected: date.isAtSameMomentAs(selectedDate), dateTime: date, day: date.day));

      }
      // List<WeekDayModel> setWeek = [weekDayList[5],weekDayList[6],weekDayList[0],weekDayList[1],weekDayList[2],weekDayList[3],weekDayList[4],];
      //
      // weekDayList = setWeek;

       monthName = DateFormat('MMMM').format(appointmentDate);

      year = appointmentDate.year.toString();


      notifyListeners();

    }


  }


  selectButton(int index){
    for(var i = 0;  i< weekDayList.length; i++){
      if(i == index){
        weekDayList[index].isSelected = true;
      }else{
        weekDayList[i].isSelected = false;
      }
    }
    notifyListeners();
  }

  List<OnlineModel> onlineList = [
    OnlineModel(title: "Voice Call", subTitle: "Can you make voice call", amount: 150.00, iconData: Icons.call),
    OnlineModel(title: "Video Call", subTitle: "Can you make video call", amount: 1500.00, iconData: Icons.video_call),
    OnlineModel(title: "Messaging", subTitle: "Can messaging with Doctor", amount: 100.00, iconData: Icons.message),
  ];

  selectOnline(int index){
    for(var i = 0; i < onlineList.length; i++){
      if(i == index){
        onlineList[i].isSelected = true;
      }else{
        onlineList[i].isSelected = false;
      }

      notifyListeners();
    }
  }

}

DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

class WeekDayModel{
  String weekName;
  DateTime dateTime;
  bool isSelected;
  int day;
   WeekDayModel({required this.weekName, this.isSelected = false, required this.dateTime, required this.day});
}
