import 'package:flutter/material.dart';

class PickDateTime{
  // String _selectedDate = "Select Date and Time";
  // String _selectedTime = '';
  // get selectedDate => _selectedDate;
  // get selectedTime => _selectedTime;

  DateTime currentDateTime = DateTime.now();

  Future<DateTime?> pickDate(BuildContext context,{required DateTime initialDate}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate:initialDate,
      lastDate: DateTime(DateTime.now().year + 500, 10, 1),
    );
    return picked;
  }

  pickTime(BuildContext context) async{
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return picked;
  }

 Future<List<DateAndTime>> pickDateAndTime(BuildContext context,{required DateTime initialDate})async{
    List<DateAndTime> dateAndTimeList = [];
    DateTime? date = await pickDate(context, initialDate: initialDate);
    if(date != null){
      TimeOfDay? time = await pickTime(context);
      if(time != null){
        // print(time.format(context).runtimeType);
        dateAndTimeList = [DateAndTime(date: date, time: time, dateAndTimeString: "${date.day}-${date.month}-${date.year}, ${time.format(context)}")];
        return dateAndTimeList;
      }else{
        debugPrint("-----------------\nYou Should pick time and then you get datetime-----------------------");
        return dateAndTimeList;
      }
    }
    return dateAndTimeList;
  }
}

class DateAndTime{
  DateTime date;
  TimeOfDay time;
  String dateAndTimeString;
  DateAndTime({required this.date, required this.time, required this.dateAndTimeString});
}