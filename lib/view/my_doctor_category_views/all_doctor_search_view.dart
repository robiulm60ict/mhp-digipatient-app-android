import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/doctor_list_tile_our_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/search_text_field.dart';

// class Person implements Comparable<Person> {
//   final String name, surname;
//   final num age;
//
//   const Person(this.name, this.surname, this.age);
//
//   @override
//   int compareTo(Person other) => name.compareTo(other.name);
// }

class AllDoctorSearchView extends StatelessWidget {


  const AllDoctorSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final docVM = Provider.of<MyDoctorViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          children: [
            const SearchTextField(hintText: "Search Doctor..",),
            SizedBox(height: 10.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("  Our Doctors", textAlign: TextAlign.start, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),)),
            SizedBox(height: 10.h,),
            Expanded(child: ListView.separated(
                itemCount: 7,
                itemBuilder: (context, index){
                  return Card();
                  // return DoctorListTileOurDoc(onTap: (){
                  //   context.router.push(const DocDetailsRoute());
                  // },);
                },
            separatorBuilder: (context, index)=> SizedBox(height: 6.h,),
            ),
            ),
          ],
        ),
      ),

      /// package search

      // body: ListView.builder(
      //   itemCount: docVM.allDoctorList.first.doctors?.length,
      //   itemBuilder: (context, index) {
      //     final person = docVM.allDoctorList.first.doctors?[index];
      //
      //     return ListTile(
      //       title: Text("${person?.drGivenName}"),
      //       subtitle: Text("${person?.department?.departmentsName}"),
      //       trailing: Text("${person?.drLastName}"),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Search people',
      //   onPressed: () => showSearch(
      //     context: context,
      //     delegate: SearchPage(
      //       barTheme: ThemeData(
      //         appBarTheme: AppBarTheme(
      //           backgroundColor: AppColors.primaryColor,
      //           iconTheme: const IconThemeData(color: Colors.black),
      //         ),
      //
      //       ),
      //       onQueryUpdate: print,
      //       items: docVM.allDoctorList.first.doctors!,
      //       searchLabel: 'Search people',
      //       suggestion: const Center(
      //         child: Text('Filter people by name, surname or age'),
      //       ),
      //       failure: const Center(
      //         child: Text('No person found :('),
      //       ),
      //       filter: (person) => [
      //         person.drGivenName,
      //         person.department?.departmentsName,
      //         // person.age.toString(),
      //       ],
      //       // sort: (a, b) => a.compareTo(b),
      //       builder: (person) => ListTile(
      //         title: Text("${person.drGivenName}"),
      //         subtitle: Text("${person.department?.departmentsName}"),
      //         trailing: Text("${person.drLastName}"),
      //       ),
      //     ),
      //   ),
      //   child: const Icon(Icons.search),
      // ),
    );
  }
}
