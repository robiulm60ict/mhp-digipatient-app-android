
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/anatomy/anatomy_view_model.dart';

getDiseaseModalSheet(BuildContext context, {String name = "", String subName = ""}){
  return showModalBottomSheet(context: context,
      builder: (context) {
    final anatomy = Provider.of<AnatomyModelView>(context);
    bool val = anatomy.getSymptomsByBodyPart(name: name);
    if(!val && anatomy.getSymptomsList.isNotEmpty){
      return StatefulBuilder(
        builder: (context, setState) => SizedBox(
            height: 400.h,
            child: Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () => context.router.pop(), icon: Icon(Icons.dangerous, color: Colors.red, size: 30.h,),),
                  ),
                  Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                  SizedBox(height: 20.h,),

                  Expanded(child: ListView.builder(
                    itemCount: anatomy.getSymptomsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SwitchListTile(value: anatomy.getSymptomsList[index].isSelected ?? false, onChanged: (value) {
                          anatomy.selectSymptoms(index: index, value: value);
                          setState((){});
                        },
                          title: Text("${anatomy.getSymptomsList[index].symptomName}"),
                        ),
                      );
                    },)),
                  SizedBox(height: 10.h,),
                  CustomButton(text: "Set", onTap: () {
                    Navigator.pop(context);
                    // context.router.pop();
                  },)
                ],
              ),
            )),
      );
    }else{
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
          const SizedBox(height: 50,),
          const Center(child: CircularProgressIndicator(),),
        ],
      );
    }
  });
}