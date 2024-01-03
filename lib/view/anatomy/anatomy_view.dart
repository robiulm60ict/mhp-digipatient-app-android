import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:human_body_selector/human_body_selector.dart';
import 'package:human_body_selector/svg_painter/maps.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../resources/constants.dart';
import '../../utils/message.dart';
import '../../utils/modal_sheet.dart';
import '../../utils/user.dart';
import '../../utils/utils.dart';
import '../../view_model/anatomy/anatomy_view_model.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';

class AnatomyView extends StatefulWidget {
  const AnatomyView({Key? key}) : super(key: key);

  @override
  State<AnatomyView> createState() => _AnatomyViewState();
}

class _AnatomyViewState extends State<AnatomyView> {
  bool isFlushBarShowing = false;
  final GlobalKey flushBarKey = GlobalKey();

  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnatomyModelView>().getAnatomySymptoms(context);
      // context.read<UserViewModel>().getUserDetails();
      getUserData();
    });
  }

  var gender = '';

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    gender = prefs.getString(UserP.gender) ?? "";
    gender == "Male"
        ? _selectedValue = maleFront
        : _selectedValue = femaleFront;
  }

  returnHumanBodyFacing(selectedValue) {

    if (selectedValue == maleBack) {
      return Maps.MALE1;
    } else if (selectedValue == femaleFront) {
      return Maps.HUMAN;
    } else if (selectedValue == femaleBack) {
      return Maps.HUMAN1;
    } else {
      return Maps.MALE;
    }
  }

  HumanBodySelector returnBodyFacing(String selectedValue) {
    if (selectedValue == maleBack) {
      return HumanBodySelector(
        key: const ValueKey(maleBack),
        map: Maps.MALE1,
        dotColor: Colors.red,

        onChanged: (bodyPart, active) {
          debugPrint("\n\n\n\n\n\n ${bodyPart.first.title}");
          Messages.flushBarMessage(context,
              "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
        },
        onLevelChanged: (bodyPart) {
          print("bodyPart$bodyPart");
          // for (var i in bodyPart) {
          //   debugPrint(
          //       "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          // }
        },
        multiSelect: true,
        toggle: true,
        // scale: 5.5,
        // height: MediaQuery.of(context).size.height - MediaQuery.of(context).a,
        // width: double.infinity,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    } else if (selectedValue == femaleFront) {
      return HumanBodySelector(
        key: const ValueKey(femaleFront),
        map: Maps.HUMAN,
        dotColor: Colors.red,
        onChanged: (bodyPart, active) {
          debugPrint("\n\n\n\n\n\n ${bodyPart.first.title}");

          // Messages.flushBarMessage(context,
          //     "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
        },
        onLevelChanged: (bodyPart) {
          for (var i in bodyPart) {
            debugPrint(
                "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          }
        },
        multiSelect: true,
        toggle: true,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    } else if (selectedValue == femaleBack) {
      return HumanBodySelector(
        key: const ValueKey(femaleBack),
        map: Maps.HUMAN1,
        dotColor: Colors.red,
        onChanged: (bodyPart, active) {
          Messages.flushBarMessage(context,
              "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
        },
        onLevelChanged: (bodyPart) {
          // for (var i in bodyPart) {
          //   debugPrint(
          //       "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          // }
        },
        multiSelect: true,
        toggle: true,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    } else {
      return HumanBodySelector(
        key: const ValueKey(maleFront),
        map: Maps.MALE,
        dotColor: Colors.red,
        multiSelect: true,
        onChanged: (bodyPart, active) {
          Messages.flushBarMessage(context,
              "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
        },
        onLevelChanged: (bodyPart) {
          for (var i in bodyPart) {
            debugPrint(
                "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          }
        },
        toggle: true,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<AnatomyModelView>(builder: (context, anatomy, child) {
      return WillPopScope(
        onWillPop: () {
          // anatomy.getSelectedSymptomsList();
          return Future.delayed(const Duration(milliseconds: 1000))
              .then((value) => true);
        },
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BottomAppBar(
              color: AppColors.primary_color,
              child: MaterialButton(
                elevation: 0,
                color: AppColors.primary_color,
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor:  AppColors.primary_color,
            title: Text(
              "Select Symptoms",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: AppColors.text_primary_color),
            ),
            actions: [
              DropdownButton(
                value: _selectedValue,
                items: [
                  if (gender == "Male")
                    DropdownMenuItem(
                      value: maleFront,
                      child: Text(
                        maleFront,
                        style: Style.alltext_default_balck,
                      ),
                    ),
                  if (gender == "Male")
                    DropdownMenuItem(
                      value: maleBack,
                      child: Text(
                        maleBack,
                        style: Style.alltext_default_balck,
                      ),
                    ),
                  if (gender != "Male")
                    DropdownMenuItem(
                      value: femaleFront,
                      child: Text(
                        femaleFront,
                        style: Style.alltext_default_balck,
                      ),
                    ),
                  if (gender != "Male")
                    DropdownMenuItem(
                      value: femaleBack,
                      child: Text(
                        femaleBack,
                        style: Style.alltext_default_balck,
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value is String) {
                    // provider.setSelectedValue(value);
                    setState(() {
                      _selectedValue = value;
                    });
                  }
                },
              ),
              SizedBox(
                width: kPadding.w,
              ),
            ],
          ),
          body: anatomy.isAnatomyLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    Text(
                      anatomy.anatomyStatus,
                    ),
                  ],
                )
              : Zoom(
                  initTotalZoomOut: true,
                  backgroundColor: Colors.transparent,
                  canvasColor: Colors.transparent,
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    child: HumanBodySelector(
                      key: ValueKey(_selectedValue),
                      map: returnHumanBodyFacing(_selectedValue),
                      dotColor: Colors.transparent,
                      strokeColor: Colors.greenAccent,
                      selectedColor: Colors.greenAccent.shade100,
                      onChanged: (bodyPart, active) {
                        // Messages.flushBarMessage(context,
                        //     "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}",
                        //   flushBarPosition: FlushbarPosition.BOTTOM
                        // );
                        debugPrint(
                            "${bodyPart.reversed.first.title} title ${bodyPart.reversed.first.title} id ${bodyPart.first.id} pain Level: ${bodyPart.first.painLevel} obj: ${bodyPart.first.props} active part ${active?.title}");

                        getDiseaseModalSheet(
                          context,
                          name: bodyPart.first.title,
                          gender: _selectedValue!.split(" ").first.toString(),
                        );
                        // print(_selectedValue.split(" ").first.toString());
                        // debugPrint(provider.flushBarState.toString());

                        // if (provider.flushBarState == 0) {
                        //   context.router.pop().then((value) => Future.delayed(
                        //           const Duration(milliseconds: 1500))
                        //       .then((value) => Messages.flushBarWithOption(
                        //             context,
                        //             child: SizedBox(
                        //               height: 300.h,
                        //               width: double.infinity,
                        //               child: StatefulBuilder(
                        //                 builder: (context, setState) => GridView.builder(
                        //                   itemCount: diseasesList.length,
                        //                   itemBuilder: (context, index) {
                        //                     return Card(
                        //                       // child: RadioListTile(
                        //                       //     title: Text("Diseases ${index + 1}"),
                        //                       //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
                        //                       child: CheckboxListTile(
                        //                         controlAffinity:
                        //                             ListTileControlAffinity.leading,
                        //                         title: Text(
                        //                           diseasesList[index].title,
                        //                           style: const TextStyle(),
                        //                         ),
                        //                         value: diseasesList[index].selected,
                        //                         onChanged: (bool? value) {
                        //                           if (value != null) {
                        //                             diseasesList[index].selected = value;
                        //                             setState(
                        //                               () {},
                        //                             );
                        //                           }
                        //                         },
                        //                       ),
                        //                     );
                        //                   },
                        //                   gridDelegate: FlutterzillaFixedGridView(
                        //                       crossAxisCount: 2,
                        //                       height: 50.h,
                        //                       mainAxisSpacing: 10.w,
                        //                       crossAxisSpacing: 10.h),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),),);
                        // } else {
                        //   Future.delayed(const Duration(milliseconds: 500)).then(
                        //     (value) => Messages.flushBarWithOption(
                        //       context,
                        //       child: SizedBox(
                        //         height: 300.h,
                        //         width: double.infinity,
                        //         child: StatefulBuilder(
                        //           builder: (context, setState) => GridView.builder(
                        //             itemCount: diseasesList.length,
                        //             itemBuilder: (context, index) {
                        //               return Card(
                        //                 // child: RadioListTile(
                        //                 //     title: Text("Diseases ${index + 1}"),
                        //                 //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
                        //                 child: CheckboxListTile(
                        //                   controlAffinity:
                        //                       ListTileControlAffinity.leading,
                        //                   title: Text(
                        //                     diseasesList[index].title,
                        //                     style: const TextStyle(),
                        //                   ),
                        //                   value: diseasesList[index].selected,
                        //                   onChanged: (bool? value) {
                        //                     if (value != null) {
                        //                       diseasesList[index].selected = value;
                        //                       setState(
                        //                         () {},
                        //                       );
                        //                     }
                        //                   },
                        //                 ),
                        //               );
                        //             },
                        //             gridDelegate: FlutterzillaFixedGridView(
                        //                 crossAxisCount: 2,
                        //                 height: 50.h,
                        //                 mainAxisSpacing: 10.w,
                        //                 crossAxisSpacing: 10.h),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        // }
                      },
                      onLevelChanged: (bodyPart) {
                        for (var i in bodyPart) {
                          debugPrint(
                              "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
                        }
                      },
                      // multiSelect: true,
                      toggle: true,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 150,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
