
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:human_body_selector/human_body_selector.dart';
import 'package:human_body_selector/svg_painter/maps.dart';
import 'package:provider/provider.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../resources/constants.dart';
import '../../utils/message.dart';
import '../../utils/modal_sheet.dart';
import '../../utils/utils.dart';
import '../../view_model/anatomy/anatomy_model.dart';
import '../../widgets/back_button.dart';


class AnatomyView extends StatefulWidget {
  const AnatomyView({Key? key}) : super(key: key);

  @override
  State<AnatomyView> createState() => _AnatomyViewState();
}

class _AnatomyViewState extends State<AnatomyView> {
  String _selectedValue = maleFront;
  bool isFlushBarShowing = false;
  final GlobalKey flushBarKey = GlobalKey();

  String returnHumanBodyFacing(String selectedValue) {
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
          for (var i in bodyPart) {
            debugPrint(
                "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          }
        },
        // multiSelect: true,
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
        // multiSelect: true,
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
          for (var i in bodyPart) {
            debugPrint(
                "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
          }
        },
        // multiSelect: true,
        toggle: true,

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    } else {
      return HumanBodySelector(
        key: const ValueKey(maleFront),
        map: Maps.MALE,
        dotColor: Colors.red,

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
        // multiSelect: true,
        toggle: true,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 150,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnatomyModelView>(context);

    double width = MediaQuery.of(context).size.width;

    debugPrint("Width: $width}");

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Select Diseases", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),

        actions: [
          DropdownButton(
            value: _selectedValue,
            items:  const [
              DropdownMenuItem(
                value: maleFront,
                child: Text(
                  maleFront,
                ),
              ),
              DropdownMenuItem(
                value: maleBack,
                child: Text(
                  maleBack,
                ),
              ),
              DropdownMenuItem(
                value: femaleFront,
                child: Text(
                  femaleFront,
                ),
              ),
              DropdownMenuItem(
                value: femaleBack,
                child: Text(
                  femaleBack,
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
      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: MediaQuery.of(context).size.height,
      //       child: Zoom(
      //         initTotalZoomOut: true,
      //         backgroundColor: Colors.transparent,
      //         canvasColor: Colors.transparent,
      //         child: AnimatedSwitcher(
      //           duration: const Duration(seconds: 2),
      //           child: HumanBodySelector(
      //             key: ValueKey(_selectedValue),
      //             map: returnHumanBodyFacing(_selectedValue),
      //             dotColor: Colors.transparent,
      //             strokeColor: Colors.greenAccent,
      //             selectedColor: Colors.greenAccent.shade100,
      //             onChanged: (bodyPart, active) {
      //               // Messages.flushBarMessage(context,
      //               //     "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}",
      //               //   flushBarPosition: FlushbarPosition.BOTTOM
      //               // );
      //               debugPrint("\n\n\n\n\n\n ${bodyPart.first.title} id${bodyPart.first.id} pain Level: ${bodyPart.first.painLevel} obj: ${bodyPart.first.props} active part ${active?.title}");
      //
      //               getDiseaseModalSheet(context);
      //               // debugPrint(provider.flushBarState.toString());
      //
      //               // if (provider.flushBarState == 0) {
      //               //   context.router.pop().then((value) => Future.delayed(
      //               //           const Duration(milliseconds: 1500))
      //               //       .then((value) => Messages.flushBarWithOption(
      //               //             context,
      //               //             child: SizedBox(
      //               //               height: 300.h,
      //               //               width: double.infinity,
      //               //               child: StatefulBuilder(
      //               //                 builder: (context, setState) => GridView.builder(
      //               //                   itemCount: diseasesList.length,
      //               //                   itemBuilder: (context, index) {
      //               //                     return Card(
      //               //                       // child: RadioListTile(
      //               //                       //     title: Text("Diseases ${index + 1}"),
      //               //                       //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
      //               //                       child: CheckboxListTile(
      //               //                         controlAffinity:
      //               //                             ListTileControlAffinity.leading,
      //               //                         title: Text(
      //               //                           diseasesList[index].title,
      //               //                           style: const TextStyle(),
      //               //                         ),
      //               //                         value: diseasesList[index].selected,
      //               //                         onChanged: (bool? value) {
      //               //                           if (value != null) {
      //               //                             diseasesList[index].selected = value;
      //               //                             setState(
      //               //                               () {},
      //               //                             );
      //               //                           }
      //               //                         },
      //               //                       ),
      //               //                     );
      //               //                   },
      //               //                   gridDelegate: FlutterzillaFixedGridView(
      //               //                       crossAxisCount: 2,
      //               //                       height: 50.h,
      //               //                       mainAxisSpacing: 10.w,
      //               //                       crossAxisSpacing: 10.h),
      //               //                 ),
      //               //               ),
      //               //             ),
      //               //           ),),);
      //               // } else {
      //               //   Future.delayed(const Duration(milliseconds: 500)).then(
      //               //     (value) => Messages.flushBarWithOption(
      //               //       context,
      //               //       child: SizedBox(
      //               //         height: 300.h,
      //               //         width: double.infinity,
      //               //         child: StatefulBuilder(
      //               //           builder: (context, setState) => GridView.builder(
      //               //             itemCount: diseasesList.length,
      //               //             itemBuilder: (context, index) {
      //               //               return Card(
      //               //                 // child: RadioListTile(
      //               //                 //     title: Text("Diseases ${index + 1}"),
      //               //                 //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
      //               //                 child: CheckboxListTile(
      //               //                   controlAffinity:
      //               //                       ListTileControlAffinity.leading,
      //               //                   title: Text(
      //               //                     diseasesList[index].title,
      //               //                     style: const TextStyle(),
      //               //                   ),
      //               //                   value: diseasesList[index].selected,
      //               //                   onChanged: (bool? value) {
      //               //                     if (value != null) {
      //               //                       diseasesList[index].selected = value;
      //               //                       setState(
      //               //                         () {},
      //               //                       );
      //               //                     }
      //               //                   },
      //               //                 ),
      //               //               );
      //               //             },
      //               //             gridDelegate: FlutterzillaFixedGridView(
      //               //                 crossAxisCount: 2,
      //               //                 height: 50.h,
      //               //                 mainAxisSpacing: 10.w,
      //               //                 crossAxisSpacing: 10.h),
      //               //           ),
      //               //         ),
      //               //       ),
      //               //     ),
      //               //   );
      //               // }
      //             },
      //             onLevelChanged: (bodyPart) {
      //               for (var i in bodyPart) {
      //                 debugPrint(
      //                     "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
      //               }
      //             },
      //             // multiSelect: true,
      //             toggle: true,
      //             height: MediaQuery.of(context).size.height,
      //             width: MediaQuery.of(context).size.width - 150,
      //           ),
      //         ),
      //       ),
      //     ),
      //     ListView.builder(
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, index) => const Text("data"),),
      //
      //   ],
      // ),
      body: Zoom(
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
              debugPrint("\n\n\n\n\n\n ${bodyPart.first.title} id${bodyPart.first.id} pain Level: ${bodyPart.first.painLevel} obj: ${bodyPart.first.props} active part ${active?.title}");

              getDiseaseModalSheet(context, name: bodyPart.first.title);
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
    );
  }
}

List<DiseasesModel> diseasesList =

[
  DiseasesModel(title: "Head"),
  DiseasesModel(title: "head1"),
  DiseasesModel(title: "Head2"),
  DiseasesModel(title: "Head3"),
  DiseasesModel(title: "Head4"),
  DiseasesModel(title: "Head5"),
  DiseasesModel(title: "Head6"),
  DiseasesModel(title: "Head7"),
  DiseasesModel(title: "Head8"),
  DiseasesModel(title: "Head9"),
];

class DiseasesModel {
  String title;
  bool selected;
  DiseasesModel({required this.title, this.selected = false});
}

