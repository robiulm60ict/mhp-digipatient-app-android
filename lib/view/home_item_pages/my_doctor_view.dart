import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/popup_dialogue.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

class MyDoctorView extends StatelessWidget {
  const MyDoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth.w,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: Colors.white),),
        leading: const CustomBackButton(),
        flexibleSpace: const Image(
          image: AssetImage(Assets.myDoctorAppBar),
          fit: BoxFit.fill,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          Row(
            children: [
              const Expanded(child: SearchTextField(hintText: "Search item..",)),
              SizedBox(width: 8.w,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0.r),
                  child: IconButton(onPressed: (){
                    selectCategoryPopUp(context);
                  }, icon: Icon(Icons.add_chart_sharp, color: AppColors.primaryColor,)),
                ),

              ),
              ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Text("Favourite List", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
            Spacer(),
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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),

                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22.h,
                          backgroundColor: AppColors.primaryColor,
                          child: CircleAvatar(
                            radius: 20.h,
                            child: Image.asset(Assets.avatar),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dr. Md. Sultan Sarwar Parvez",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                              SizedBox(height: 5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Speciality:", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF8A8A8A)),),
                                  Text(" Cardiac Surgeon", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),)
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      width: 62.w,
                                      fit: BoxFit.fill,
                                      Assets.hospitalLogo),
                                  Text(" Cardiac Surgeon", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
              }, child: Text("View All", style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),))
            ],
          ),
          SizedBox(height: 6.h,),
          // SizedBox(height: 300.h,)
          GridView.builder(
              shrinkWrap: true,
              // physics: null,
              itemCount: provider.categoryItemsList.length,
              gridDelegate: FlutterzillaFixedGridView(
              crossAxisCount: 2,mainAxisSpacing: 10.w, crossAxisSpacing: 10.h,
                height: 75.h,

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
                      SizedBox(
                        height: 35.h,
                        width: 35.w,
                        child: Image.asset(provider.categoryItemsList[index].image, fit: BoxFit.fill,),
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
