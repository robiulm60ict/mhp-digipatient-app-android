import 'package:digi_patient/view/myClinic/clinic_branches_view/branches_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../../../generated/assets.dart';
import '../../../model/clinic/orgamozationlist_model.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/utils.dart';
import '../../../view_model/clinic/my_clinic_view_model/my_clinic_view_model.dart';
import '../../../widgets/back_button.dart';

class ClinicBranches extends StatelessWidget {
  ClinicBranches({super.key, required this.organizationListModle});

  OrganizationListModle organizationListModle;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyClinicViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          backgroundColor: AppColors.linearGradient2,
          title: Text(
            "Branch List",
            style: Style.alltext_appbar,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Style.distan_size10,
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/picturebuttons1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 130.w,
                  width: double.infinity,
                ),
                Style.distan_size10,
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: AppColors.primaryColor)),
                  child: ListTile(
                    onTap: () => customSearchNOnRegisterDialogue(context,
                        branch:
                            organizationListModle.organization!.branch! ?? [],
                        dbName: organizationListModle.organization!.dbName
                            .toString()),
                    leading: Icon(
                      Icons.search_rounded,
                      color: AppColors.primaryColor,
                      size: 25.h,
                    ),
                    title: Text(
                      "Search your branch",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        organizationListModle.organization!.branch!.length,
                    itemBuilder: (context, index) {
                      var branch =
                          organizationListModle.organization!.branch![index];
                      return InkWell(
                        onTap: () {
                          provider.copypateitnpostclinicRequest(
                              context,
                              organizationListModle.organization!.dbName
                                  .toString(),
                              branch.id.toString(),
                              branch.name.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BranchesDetails(
                                      branch: branch,
                                      DbName: organizationListModle
                                          .organization!.dbName
                                          .toString())));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              // color:index%2==0? Color(0xff71B92A).withOpacity(0.5):Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.only(
                              left: 8, right: 4, top: 8, bottom: 8),
                          margin: EdgeInsets.only(
                              left: 0, right: 0, top: 4, bottom: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                child:

                                // branch.logo.toString() ==
                                //     "null"
                                //     ? SizedBox(
                                //   //height: 110,
                                //   // width: 90.w,
                                //     child: const CircleAvatar(
                                //       radius: 30,
                                //       backgroundImage:
                                //       AssetImage(Assets.nodatafound),
                                //     ))
                                //     :
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                   "assets/icons/branch.png",
                                  ),
                                  radius: 30,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 200.w,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Style.distan_size2,
                                      Text(
                                        branch.name.toString(),
                                        style: Style.alltext_default_balck_w700,
                                      ),
                                      Style.distan_size5,
                                      Text(branch.address.toString(),
                                          style: Style.alltext_default_balck),
                                      Style.distan_size2,
                                    ]),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                // width: 70.w,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            provider
                                                .copypateitnpostclinicRequest(
                                                    context,
                                                    organizationListModle
                                                        .organization!.dbName
                                                        .toString(),
                                                    branch.id.toString(),
                                                    branch.name.toString());
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BranchesDetails(
                                                            branch: branch,
                                                            DbName: organizationListModle
                                                                .organization!
                                                                .dbName
                                                                .toString())));
                                          },
                                          child: Image.asset(
                                            "assets/icons/details.png",
                                            width: 50,
                                            height: 50,
                                          )),
                                      // InkWell(
                                      //     onTap: () {
                                      //       Navigator.push(
                                      //           context,
                                      //           MaterialPageRoute(
                                      //               builder: (context) =>
                                      //                   MyClinicServices()));
                                      //     },
                                      //     child: Image.asset(
                                      //       "assets/icons/service.png",
                                      //       width: 50,
                                      //       height: 50,
                                      //     )),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

customSearchNOnRegisterDialogue(BuildContext context,
    {required List<Branch> branch, String? dbName}) {
  final provider = Provider.of<MyClinicViewModel>(context, listen: false);

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
      items: branch,
      searchLabel: 'Search patient',
      suggestion: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Filter Branch Name or mobile number or address '),
        ),
      ),
      failure: const Center(
        child: Text('No Branch found :('),
      ),
      filter: (branch) => [
        branch.name.toString(),
        branch.address.toString(),
        branch.phone.toString()
      ],
      // sort: (a, b) => a.compareTo(b),
      builder: (branch) => Padding(
        padding: EdgeInsets.all(8.0.r),
        child: InkWell(
          onTap: () {
            provider.copypateitnpostclinicRequest(context, dbName.toString(),
                branch.id.toString(), branch.name.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BranchesDetails(
                        branch: branch, DbName: dbName.toString())));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                // color:index%2==0? Color(0xff71B92A).withOpacity(0.5):Colors.white,
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.only(left: 8, right: 4, top: 8, bottom: 8),
            margin: EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 4),
            child: Row(
              children: [
                SizedBox(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      branch.logo.toString(),
                    ),
                    radius: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  width: 200.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Style.distan_size2,
                        Text(
                          branch.name.toString(),
                          style: Style.alltext_default_balck_w700,
                        ),
                        Style.distan_size5,
                        Text(branch.address.toString(),
                            style: Style.alltext_default_balck),
                        Style.distan_size2,
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 2),
                  // width: 70.w,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              provider.copypateitnpostclinicRequest(
                                  context,
                                  dbName.toString(),
                                  branch.id.toString(),
                                  branch.name.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BranchesDetails(
                                          branch: branch,
                                          DbName: dbName.toString())));
                            },
                            child: Image.asset(
                              "assets/icons/details.png",
                              width: 50,
                              height: 50,
                            )),
                        // InkWell(
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   MyClinicServices()));
                        //     },
                        //     child: Image.asset(
                        //       "assets/icons/service.png",
                        //       width: 50,
                        //       height: 50,
                        //     )),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
