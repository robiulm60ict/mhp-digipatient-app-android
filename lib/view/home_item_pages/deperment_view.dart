import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';

import 'package:digi_patient/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../../resources/styles.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/shimmer.dart';
import '../../view_model/doctor/my_doctor_view_model.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import 'my_doctor_view.dart';

class DepermentView extends StatefulWidget {
  DepermentView({Key? key}) : super(key: key);


  @override
  State<DepermentView> createState() => _MyDoctorViewState();
}


class _MyDoctorViewState extends State<DepermentView> {
  @override
  void initState() {
    context.read<MyDoctorViewModel>().getDepartments(context);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dvm = Provider.of<MyDoctorDelaisViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.page_background_color,
      appBar: AppBar(
        leadingWidth: leadingWidth,
        toolbarHeight: 60.h,
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Doctor",
          style: Style.alltext_appbar,
        ),
        // leading: Padding(
        //   padding: Platform.isIOS
        //       ? const EdgeInsets.only(bottom: 40)
        //       : EdgeInsets.symmetric(vertical: width < 411 ? 20.0 : 30),
        //   child: const CustomBackButton(),
        // ),
        flexibleSpace: const Image(
          image: AssetImage(Assets.imagesMyDoctorAppBar),
          fit: BoxFit.fill,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Container(
          padding: EdgeInsets.only(left: 12,right: 12),
          width: double.infinity,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 4.h,
                  ),
                  Consumer<MyDoctorViewModel>(
                      builder: (context, data, child) {
                        if (data.department.isEmpty) {
                          return data.isDepartmentLoading == true
                              ? GridView.builder(
                            itemCount: 12,
                            shrinkWrap: true,
                            gridDelegate: FlutterzillaFixedGridView(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 16,
                                height: 175.h),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: bannerShimmereffect(
                                    94.toDouble(), 385.toDouble()),
                              );
                            },
                          )
                              : noDataFounForList(
                              "Currently you have no records");
                        } else {
                          return GridView.builder(
                            itemCount: data.department.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: FlutterzillaFixedGridView(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 16,
                                height: 50.h),
                            itemBuilder: (context, index) {
                              var docc = data.department[index];

                              return InkWell(
                                  onTap: (){
                                    dvm.getmyAllDoctors(context,docc.id.toString());
                                    dvm.getmyAllDeactiveDoctors(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDoctorView()));
                                  },
                                  child: Card(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text(docc.departmentsName.toString())),
                                  )));
                            },
                          );
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
