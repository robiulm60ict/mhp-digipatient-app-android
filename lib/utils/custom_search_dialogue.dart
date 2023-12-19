import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_page/search_page.dart';

import '../model/doctor_model/doctors_model.dart';
import '../model/myDoctorList/mydoctorList.dart';
import '../resources/app_url.dart';
import '../resources/colors.dart';
import '../routes/routes.gr.dart';
import '../view/my_doctor_category_views/doc_details_view.dart';
import '../widgets/doctor_list_tile_our_doc.dart';

customSearchDialogue(BuildContext context,
    {required List<Datum> doctorList}) {
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
      items: doctorList,
      searchLabel: 'Search doctor',
      suggestion: const Center(
        child: Text('Filter doctors by name, department or hospital name'),
      ),
      failure: const Center(
        child: Text('No doctor found :('),
      ),
      filter: (doctor) => [
        doctor.doctors?.drGivenName,
        doctor.doctors?.drMiddleName,
        doctor.doctors!.title?.titleName,
        doctor.doctors?.department?.departmentsName,
        doctor.doctors?.usualProvider?.usualProviderName,
      ],
      // sort: (a, b) => a.compareTo(b),
      builder: (doctor) => Padding(
        padding: EdgeInsets.all(8.0.r),
        child: DoctorListTileOurDoc(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DocDetailsView(id: doctor!.doctorsMasterId!)));

            // context.router
            //     .push(DocDetailsRoute(id: doctor.doctorsMasterId!.toInt()));
           // context.router.push(DocDetailsRoute(id: doctor.id!));
          },
          docDegree: "",
          docDepartment: doctor.doctors?.department?.departmentsName ?? "",
          docHospitalImage:  "${doctor?.doctors!.usualProvider!= null ? doctor?.doctors!.usualProvider!.usualProviderName.toString() : ""}",
           docName: "${doctor.doctors!.title!.titleName} ${doctor.doctors?.drGivenName} ${doctor.doctors?.drMiddleName} ${doctor.doctors?.drLastName}",
          //docName: doctor.drFullName ?? "",
          docRating: 5,
          docUrl:
              "${AppUrls.drprofile}${doctor.doctors?.drImages!}",
          docHospitalName: doctor.doctors?.usualProvider?.usualProviderName ?? "",
        ),
      ),
    ),
  );
}
