import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/popup_dialogue.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/doctor_list_tile.dart';
import 'package:digi_patient/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../routes/routes.gr.dart';


class MyDoctorView extends StatelessWidget {
  const MyDoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorViewModel>(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: Colors.white),),
        leading: Padding(
          padding: Platform.isIOS ? const EdgeInsets.only( bottom: 60) :  EdgeInsets.symmetric(vertical: width < 411 ? 20.0 : 30),
          child: const CustomBackButton(),
        ),
        flexibleSpace: const Image(
          image: AssetImage(Assets.imagesMyDoctorAppBar),
          fit: BoxFit.fill,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          Row(
            children: [
               Expanded(child: SearchTextField(
                height: 50.h,
                // suffixIcon: Card(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8.r)
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.all(2.0.r),
                //     child: IconButton(onPressed: (){
                //       selectCategoryPopUp(context);
                //     }, icon: Icon(Icons.add_chart_sharp, color: AppColors.primaryColor,)),
                //   ),
                //
                // ),
                 suffixIcon: IconButton(onPressed: (){
                   selectCategoryPopUp(context);
                 }, icon: Icon(Icons.add_chart_sharp, color: AppColors.primaryColor,),),
                hintText: "Search item..",),),
              SizedBox(width: 8.w,),

              ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Text("Favourite List", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
            const Spacer(),
              TextButton(onPressed: (){
                debugPrint("view all");
              }, child: Text("View All", style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),))
            ],
          ),
          SizedBox(height: 6.h,),
          SizedBox(
            height: 90.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width - 25,
                child: DoctorListTileFavourite(onTap: (){
                  context.router.push(const DocDetailsRoute());
                },),
              );
            }),
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Text("Category", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
              const Spacer(),
              TextButton(onPressed: (){
                debugPrint("view all");
                context.router.push(const AllDoctorSearchRoute());
              }, child: Text("View All", style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),))
            ],
          ),
          SizedBox(height: 6.h,),

          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.categoryItemsList.length,
              gridDelegate: FlutterzillaFixedGridView(
              crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.h,
                height: 80.h,

          ), itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                provider.categoryRouteTo(context, index);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          width: 35.w,
                          child: Image.asset(provider.categoryItemsList[index].image, fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(provider.categoryItemsList[index].title, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
