import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/view_model/home_view_model.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late String? name;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData()async{
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString(UserP.name) ?? "";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = (size.width / 3);
    width = width + width;
    debugPrint(size.width.toString());
    final provider = Provider.of<HomeViewModel>(context);
    final dvm = Provider.of<MyDoctorViewModel>(context);
    final authVM = Provider.of<AuthViewModel>(context);
    return SafeArea(
      top: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        extendBody: true,
        drawer: Drawer(
          width: width ,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(70.w)),
            borderSide: BorderSide.none,
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  const CustomBackButton(margin: 0, padding: 8,),
                  Expanded(child: Text("Menu", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),)),
                ],
              ),
              SizedBox(height: 50.h,),
              DrawerListTile(iconData: Icons.person, title: "Profile", onTap: (){},),
              SizedBox(height: 6.h,),
              DrawerListTile(iconData: Icons.calendar_view_day, title: "Appointment", onTap: (){},),
              SizedBox(height: 6.h,),
              DrawerListTile(iconData: Icons.favorite_border, title: "Favourite", onTap: (){},),
              SizedBox(height: 6.h,),
              DrawerListTile(iconData: Icons.payment, title: "Payment & Invoice", onTap: (){},),
              SizedBox(height: 6.h,),
              DrawerListTile(iconData: Icons.fact_check_outlined, title: "Faq", onTap: (){},),
              SizedBox(height: 6.h,),
              DrawerListTile(iconData: Icons.privacy_tip, title: "Privacy & Policy", onTap: (){},),
              SizedBox(height: 6.h,),
              Card(
                color: AppColors.primaryColor,
                child: ListTile(
                  onTap: () async{

                    final prefs = await SharedPreferences.getInstance();

                    await prefs.setBool(UserP.isLoggedIn, false);

                    context.router.replace(const SignInRoute());

                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.logout, size: 15.h, color: AppColors.primaryColor,),
                  ),
                  title: Text("Logout", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
              SizedBox(height: 5.h),
              Text("V 2.0.0(200)", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFFAAAAAA)),)
            ,SizedBox(height: 100.h,),
            ],
          ),
        ),

        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) {
              return InkWell(onTap: (){
                Scaffold.of(context).openDrawer();
              }, child: Image.asset(Assets.iconsDrawer, height: 100, width: 100,),);
            }
          ),
          actions: [
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     const SizedBox(height: 15,),
            //     badges.Badge(
            //       position: BadgePosition.topEnd(top: 3, end: 6),
            //         badgeContent: const Text("6", style: TextStyle(color: Colors.white),),
            //         child: IconButton(onPressed: (){
            //           context.router.push(const NotificationsRoute());
            //         }, icon: Icon(Icons.notification_important, color: AppColors.primaryColor,))),
            //   ],
            // ),
            badges.Badge(
                position: BadgePosition.topEnd(top: 3, end: 6),
                badgeContent: const Text("6", style: TextStyle(color: Colors.white),),
                child: IconButton(onPressed: (){
                  context.router.push(const NotificationsRoute());
                }, icon: Icon(Icons.notification_important, color: AppColors.primaryColor,))),

            SizedBox(width: 8.w,),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            Container(
              height: 153.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.imagesWelcomeBackground))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp, color: AppColors.primaryColor ),),
                  SizedBox(height: 8.h,),
                  Text("${name}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: const Color(0xFF454545)),),
                  Text("Welcome to MacroHealthPlus", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: 14.sp, color: const Color(0xFF7A7A7A),),),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            // SizedBox(
            //     height: 100.h,
            //     child: Image.asset('assets/images/macro-health-plus.png', height: 100.h, width: 300.w,)),
            Container(
              height: 31.h,
              // width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.imagesMacroHealthPlus))
              ),
            ),
            SizedBox(height: 15.h,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        backgroundColor:  const Color(0xFFF0F3F6),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.call, size: 18.h, color: AppColors.primaryColor,))),
                    CircleAvatar(
                        backgroundColor:  const Color(0xFFF0F3F6),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.video_call, size: 18.h, color: AppColors.primaryColor,))),
                    CircleAvatar(
                        backgroundColor:  const Color(0xFFF0F3F6),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.message, size: 18.h, color: AppColors.primaryColor,))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h,),
            Text("What do you need?", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
            SizedBox(height: 18.h,),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            //   mainAxisSpacing: 5.h,
            //   crossAxisSpacing: 10.w,
            //   mainAxisExtent: 130
            //
            //   // maxCrossAxisExtent: 200,
            //   // childAspectRatio: 3/1,
            //   // crossAxisSpacing: 5.h,
            //   // mainAxisSpacing: 5.w,
            // ),
                gridDelegate:  FlutterzillaFixedGridView(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    height: 90.h
                ),
                itemCount: provider.homeItemsList.length,
                itemBuilder: (BuildContext context, index){
              // return Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12.r)
              //   ),
              // );
              //     return Card(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12.r)
              //           ),
              //       child: ListTile(
              //         onTap: (){},
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.r),
              //         ),
              //         leading: const CircleAvatar(),
              //         title: Text("My Doctor", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
              //       ),
              //     );
                  return InkWell(
                    onTap: (){

                      dvm.getAllDoctors(context);

                      dvm.getDepartments(context);

                      provider.homeItemsRouteTo(context, index);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.only(bottom: 4.h),
                        //   height: 70.h,
                        //   // padding: EdgeInsets.all(18.r),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.primaryColor,
                        //     borderRadius: BorderRadius.circular(12.r),
                        //     image: const DecorationImage(
                        //       // fit: BoxFit.fill,
                        //       image: AssetImage(Assets.myDoctor),),
                        //   ),
                        // ),
                        SizedBox(
                          height: 70.h,
                          width: double.infinity,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0.r),
                              child: Image.asset(provider.homeItemsList[index].image,),
                            ),
                          ),
                        ),

                        Text(provider.homeItemsList[index].title, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)
                      ],
                    ),
                  );
            }),
            SizedBox(height: 100.h,),
          ],
        ),
      ),
    );
  }
}
