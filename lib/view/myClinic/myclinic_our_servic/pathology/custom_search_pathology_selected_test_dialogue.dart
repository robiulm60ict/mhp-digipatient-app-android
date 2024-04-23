import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../../../../model/testmodel/testmodellist.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';
import '../../../../view_model/my_record_view_model/my_record_view_model.dart';



customSearchPathologyDialogue(BuildContext context,
    {required  List<TestName> testlistfavert}) {

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
      items: testlistfavert,
      searchLabel: 'Search selected test',
      suggestion: const Center(
        child: Text('Filter doctors by name, price'),
      ),
      failure: const Center(
        child: Text('No doctor found :('),
      ),
      filter: (test) => [
        test.testName,
        test.fee,

      ],
      // sort: (a, b) => a.compareTo(b),
      builder: (test) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.cloud_done_rounded,
                color: AppColors.primary_color,
              ),
              Style.widthdistan_size20,
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Text(
                      test.testName
                          .toString(),
                      style: Style.alltext_default_balck,
                    ),
                    width: 200,
                  ),
                  Style.distan_size2,
                  Text(
                    "${test.fee.toString()} BDT",
                    style: Style.alltext_small_black,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {  final myRecord = Provider.of<MyRecordViewModel>(context);

            myRecord.testlistfavert.remove(test);

            },
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ],
      )
    ),
  );
}
