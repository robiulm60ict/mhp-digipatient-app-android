import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../view_model/home_view_model.dart';
import '../../view_model/user_view_model/user_view_model.dart';

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
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [

            GridView.builder(
              itemCount: clinic.serviceItemsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: FlutterzillaFixedGridView(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  height: 90.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    clinic.homeItemsRouteTo(context, index);
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
