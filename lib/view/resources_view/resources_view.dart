import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/resources_view_model/resources_view_model.dart';
import '../../widgets/back_button.dart';

class ResourcesView extends StatelessWidget {
  const ResourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResourcesViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        title: Text(
          "Resources",
          style: Style.alltext_ExtraLarge_white,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Style.distan_size20,
            Padding(
              padding:  EdgeInsets.only(left: 8,right: 8),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: FlutterzillaFixedGridView(
                      crossAxisCount: 1,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      height: 90.h),
                  itemCount: provider.resourseImageItemsList.length,
                  itemBuilder: (BuildContext context, index) {
                 return    InkWell(
                   onTap: () {


                     provider.homeItemsRouteTo(context, index);
                   },
                   child: Card(
                     elevation: 4,
                     shadowColor: AppColors.primary_color,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         // mainAxisSize: MainAxisSize.min,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             // height: 75.h,
                             width: 75.w,
                             child:

                             CircleAvatar(
                               radius: 35,
                               child: Image.asset(
                                 width: 70.w,
                                 provider.resourseImageItemsList[index].image,
                               ),
                               backgroundColor: Colors.white,
                               // backgroundImage:AssetImage(
                               //   provider.homeItemsList[index].image,
                               // ),
                             ),
                           ),
                           // Style.widthdistan_size5,
                           SizedBox(
                             width: 190.w,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment
                                   .start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   provider.resourseImageItemsList[index].title
                                       .toString(),
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                   textAlign: TextAlign.center,
                                   style: Style.alltext_Large_black,
                                 ),

                               ],
                             ),
                           ),
                           Style.widthdistan_size10,
                           Image.asset("assets/icons/home/homebutton.png")
                         ],
                       ),
                     ),
                   ),
                 );
                    // return  Column(
                    //   children: [
                    //     Card(
                    //       elevation: 8,
                    //       color: Colors.white,
                    //       shadowColor: Colors.black,
                    //       shape: RoundedRectangleBorder(
                    //
                    //         // side: new BorderSide(
                    //         //     color: AppColors.primaryColor, width: 2.0),
                    //           borderRadius: BorderRadius.circular(8.0)),
                    //       child: Container(
                    //         padding: EdgeInsets.all(8.0),
                    //         color: AppColors.page_background_color,
                    //         child: InkWell(
                    //           onTap: () {
                    //           provider.homeItemsRouteTo(context, index);
                    //           },
                    //           child: Column(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               Container(
                    //                 padding: EdgeInsets.all(1.0),
                    //                 decoration: BoxDecoration(
                    //                   //  color: Colors.green.shade50,
                    //                     // border: Border.all(
                    //                     //     color: Colors.redAccent),
                    //                     shape: BoxShape.circle),
                    //                 height: 65.h,
                    //                 width: double.infinity,
                    //                 child: Padding(
                    //                   padding: EdgeInsets.all(6.0),
                    //                   child: Image.asset(
                    //                     provider.resourseImageItemsList[index].image,
                    //                     // fit: BoxFit.fill,
                    //                  //   color: Colors.green,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Style.distan_size2,
                    //     Text(
                    //       provider.resourseImageItemsList[index].title,
                    //       maxLines: 2,
                    //       overflow: TextOverflow.ellipsis,
                    //       textAlign: TextAlign.center,
                    //       style: Style.alltext_default_balck_dashbord,
                    //     )
                    //   ],
                    // );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
