import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/home_view_model.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';

class AppoinmentCatagoryView extends StatefulWidget {
  const AppoinmentCatagoryView({super.key});

  @override
  State<AppoinmentCatagoryView> createState() => _AppoinmentCatagoryViewState();
}

class _AppoinmentCatagoryViewState extends State<AppoinmentCatagoryView> {

  @override
  Widget build(BuildContext context) {
    final clinic = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.page_background_color,
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        backgroundColor: AppColors.primary_color,
        centerTitle: true,
        title: Text(
          "Appointments",
          style: Style.alltext_appbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 14,right: 14),
        child: Column(
          children: [Style.distan_size15,
            Consumer<UserViewModel>(
                builder: (context, userprovider, child) {
                  if (userprovider.userData.isEmpty) {
                    return userprovider.isUserLoading == true
                        ? Center(
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: bannerShimmereffect(
                                80.toDouble(), 400.toDouble()),
                          );
                        },
                      ),
                    )
                        : noDataFounForList("");
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        userprovider.user?.patientImages.toString() ==
                            "null"
                            ? SizedBox(
                          //height: 110,
                          // width: 90.w,
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              AssetImage(Assets.dummy_image),
                            ))
                            : SizedBox(
                          // height: 110,
                          // width: 90.w,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                "${AppUrls.image}${userprovider.user?.patientImages}",
                              ),
                            )

                          // Image.network(
                          //
                          //   height: 110,
                          //   width: 90.w,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Style.distan_size10,

                        Text(
                          "${userprovider.user?.patientFirstName} ${userprovider.user?.patientLastName}"
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color(0xFF454545)),
                        ),
                        Style.distan_size5,
                        Text(
                          "${userprovider.user?.patientEmail??"N?A"}"
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color(0xFF454545)),
                        ),
                      ],
                    );
                  }
                }),
            Style.distan_size15,
            GridView.builder(
              itemCount: clinic.serviceItemsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: FlutterzillaFixedGridView(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  height: 130.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    clinic.appoinmentcatagoryItemsRouteTo(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primary_color,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            clinic.serviceItemsList[index].image,
                            height: 50,
                          ),
                          Style.distan_size20,
                          Text(
                            clinic.serviceItemsList[index].title,
                            style: Style.alltext_default_balck_blod,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
