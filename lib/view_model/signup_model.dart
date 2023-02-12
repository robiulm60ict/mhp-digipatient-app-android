
import 'package:flutter/material.dart';

class SignUpModel with ChangeNotifier{

  final DateTime _dateTime = DateTime.now();
  String  _selectedDate = "Date of Birth";
  get selectedDate => _selectedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1996,1,1),
        firstDate: DateTime(1900),
        lastDate: _dateTime);
    if (picked != null ) {
      _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
    }else{
      _selectedDate = "Date of Birth";
    }
    notifyListeners();
  }
}