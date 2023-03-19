
import 'package:digi_patient/utils/datetime.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppointmentViewModel with ChangeNotifier{

  DateTime appointmentDate = DateTime.now();

  String monthName = DateFormat('MMMM').format(DateTime.now());

  List<WeekDayModel> weekDayList = [];

  setAppointmentDate(BuildContext context) async{

    DateTime? selectedDate = await PickDateTime().pickDate(context, initialDate: appointmentDate);

    if(selectedDate != null){

      appointmentDate = selectedDate;

      DateTime startWeekDay = getDate(appointmentDate.subtract(Duration(days: appointmentDate.weekday - 1)));

      startWeekDay = startWeekDay.subtract(const Duration(days: 2));

      weekDayList.clear();

      for(var i = 0; i<7; i++){

        DateTime date = startWeekDay.add(Duration(days: i));

        weekDayList.add(WeekDayModel(weekName: DateFormat("EEEE").format(date).substring(0,3), isSelected: date.isAtSameMomentAs(selectedDate), dateTime: date, day: date.day));

      }
       monthName = DateFormat('MMMM').format(appointmentDate);


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
