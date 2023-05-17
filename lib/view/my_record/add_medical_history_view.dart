import 'package:digi_patient/utils/datetime.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/colors.dart';
import '../../utils/user.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class AddMedicalHistoryView extends StatefulWidget {
  const AddMedicalHistoryView({Key? key}) : super(key: key);

  @override
  State<AddMedicalHistoryView> createState() => _AddMedicalHistoryViewState();
}

class _AddMedicalHistoryViewState extends State<AddMedicalHistoryView> {

  DateTime? selectedDate;
  TextEditingController condition = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController saverty = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController summary = TextEditingController();
  TextEditingController myHealthRecord = TextEditingController();
  TextEditingController details = TextEditingController();
  bool isConfidential = true;
  String docId = "1";
  late String userId;


  getUserID()async{
    final prefs = await SharedPreferences.getInstance();
    var id =  prefs.getInt(UserP.id );
    userId = id.toString();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  void dispose() {
    super.dispose();
    condition.dispose();
    code.dispose();
    saverty.dispose();
    description.dispose();
    summary.dispose();
    myHealthRecord.dispose();
    details.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Add Medical History", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: myRecord.isAddMedicalHistoryLoading ? const CircularProgressIndicator() : FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          dynamic body = {
            "date" : selectedDate.toString(),
            "doctor_id": docId,
            "patient_id" : userId,
            "condition" : condition.text,
            "code" : code.text,
            "saverty" : saverty.text,
            "description" : description.text,
            "summary" : summary.text,
            "confidential" : isConfidential.toString(),
            "myHealthRecord" : myHealthRecord.text,
            "details" : details.text,
          };

          if(selectedDate != null && condition.text.isNotEmpty && code.text.isNotEmpty && saverty.text.isNotEmpty && description.text.isNotEmpty && summary.text.isNotEmpty && myHealthRecord.text.isNotEmpty && details.text.isNotEmpty ){
            myRecord.addMedicalHistory(context, body);
          }else{
            Messages.snackBar(context, "Enter All of the Field");
          }
        },
        label: Text("Save", style: TextStyle(fontSize: 15.sp, color: Colors.white),),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.date_range, color: AppColors.primaryColor,),
              title: Text(selectedDate == null ? "Select Date" : myRecord.getDate(selectedDate.toString())),
              onTap: ()async{
                // selectedDate = await PickDateTime().pickDate(context, initialDate: DateTime.now());
                await showDatePicker(
                  context: context,
                  initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(DateTime.now().year + 500, 10, 1),
                ).then((value) => selectedDate = value);
                setState(() {

                });
              },
            ),
          ),
          SizedBox(height: 10.h,),
         CustomTextField(
           textEditingController: condition,
           hintText: "Condition",
         ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: code,
            hintText: "code",
          ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: saverty,
            hintText: "severty",
          ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: description,
            hintText: "description",
          ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: summary,
            hintText: "summary",
          ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: myHealthRecord,
            hintText: "my health record",
          ),
          SizedBox(height: 10.h,),
          CustomTextField(
            textEditingController: details,
            hintText: "details",
          ),

          SizedBox(height: 200.h,)
        ],
      ),
    );
  }
}
