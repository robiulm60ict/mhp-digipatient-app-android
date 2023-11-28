import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:search_page/search_page.dart';

import '../../../model/resources/patient_education/patient_education_subcatagory.dart';
import '../../../resources/colors.dart';
import 'patient_education_resoures_view.dart';




customSearchSubCategoryDialogue(BuildContext context,
    {required List<PatientEducationSubCatagory> register}) {
  return showSearch(
    context: context,
    delegate: SearchPage(
      barTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
      ),
      onQueryUpdate: print,
      items: register,
      searchLabel: 'Search information',
      suggestion: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Filter information '),
        ),
      ),
      failure: const Center(
        child: Text('No doctor found :('),
      ),
      filter: (register) => [
        register.subCategoryName.toString(),

      ],
      // sort: (a, b) => a.compareTo(b),
      builder: (register) => Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Padding(
            padding:  EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientEducationResouresView(subcatagoryId: register.id,)));

              },
              child: Card(
                color: Colors.white,
                child: ListTile(

                  enabled: true,
                  title: Text(register.subCategoryName.toString()),
                ),
              ),
            ),
          )
      ),
    ),
  );
}
