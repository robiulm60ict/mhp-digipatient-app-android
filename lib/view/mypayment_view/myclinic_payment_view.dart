import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../utils/message.dart';
import '../../utils/utils.dart';

import '../../view_model/clinic/my_clinic_view_model/my_clinic_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';
import 'brance_mypayment_view.dart';

class MyClinicPaymentView extends StatefulWidget {
  const MyClinicPaymentView({super.key});

  @override
  State<MyClinicPaymentView> createState() => _MyClinicViewState();
}

class _MyClinicViewState extends State<MyClinicPaymentView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyClinicViewModel>().getoriganization(context);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyClinicViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
        title: Text("My Clinic",style: Style.alltext_appbar,),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Style.distan_size10,


              Consumer<MyClinicViewModel>(builder: (context, data, child) {
                if (data.organizationlistmodel.isEmpty) {
                  return data.isorgaizationLoading == true
                      ? Center(
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: bannerShimmereffect(
                              94.toDouble(), 385.toDouble()),
                        );
                      },
                    ),
                  )
                      : noDataFounForList("Currently you have no records");
                } else {
                  return Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.organizationlistmodel.length,
                          itemBuilder: (context, index) {
                            var organzation=data.organizationlistmodel[index];
                            return InkWell(
                              onTap: () {
                                // MyClinicDoctorViewModel
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyBrancePatmentView(DbName: organzation.organization!.dbName.toString(),)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colors.black12,
                                  // ),B8DC94
                                    color: index % 2 == 0
                                        ? Color(0xffB8DC94)
                                        : Color(0xffF7F7F7),
                                    borderRadius: BorderRadius.circular(8)),
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, top: 4, bottom: 4),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 80,
                                        width: 70.w,
                                        //height: 110,
                                        // width: 90.w,
                                        child: organzation.organization!.logo.toString() ==
                                            "null"
                                            ?Image.asset(Assets.nodatafound)

                                            :
                                        Image.network(organzation
                                            .organization!.logo
                                            .toString(),)),


                                    Container(
                                      padding: EdgeInsets.only(left: 12),
                                      width: 240.w,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            organzation.organization!.name.toString(),
                                            style: Style.alltext_default_balck_w700,
                                          ),
                                          Style.distan_size5,
                                          Text(  organzation.organization!.address.toString(),
                                              style: Style.alltext_default_balck),
                                          Style.distan_size5,
                                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.shop,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              Style.widthdistan_size2,
                                              Text(
                                                "${  organzation.organization!.branch!.length.toString()} branches",
                                                style: Style.alltext_small_black,
                                              ),
                                              Style.widthdistan_size10,
                                              // Icon(
                                              //   Icons.deck,
                                              //   color: Colors.grey,
                                              //   size: 20,
                                              // ),
                                              // Style.widthdistan_size2,
                                              // Text(
                                              //   "644 m2",
                                              //   style: Style.alltext_small_black,
                                              // ),
                                            ],
                                          ),
                                          Style.distan_size5,
                                          Row(
                                            children: [

                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              Style.widthdistan_size10,
                                              Icon(
                                                Icons.arrow_circle_right_outlined,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
