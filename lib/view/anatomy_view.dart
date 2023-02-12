// // import 'package:flutter/cupertino.dart';
// // import 'package:mhp_patient/generated/assets.dart';
// // import 'package:path_drawing/path_drawing.dart';
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key});
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   String clicked = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: <Widget>[
// //         _getClippedImage(
// //           clipper: _Clipper(
// //             svgPath: svgCarPath,
// //             offset: const Offset(66, 157),
// //           ),
// //           image: Assets.iconsAdmissionHistoryIcon,
// //           onClick: _handleClick('car'),
// //         ),
// //         _getClippedImage(
// //           clipper: _Clipper(
// //             svgPath: svgManPath,
// //             offset: const Offset(115, 53),
// //           ),
// //           image: Assets.iconsAdmissionHistoryIcon,
// //           onClick: _handleClick('man'),
// //         ),
// //         Positioned(
// //           bottom: 0,
// //           child: Text(
// //             clicked,
// //             style: const TextStyle(fontSize: 30),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   void Function() _handleClick(String clickedImage) {
// //     return () => setState(() {
// //       clicked = clickedImage;
// //     });
// //   }
// //
// //   Widget _getClippedImage({
// //     required _Clipper clipper,
// //     required String image,
// //     required void Function() onClick,
// //   }) {
// //     return ClipPath(
// //       clipper: clipper,
// //       child: GestureDetector(
// //         onTap: onClick,
// //         child: Image.asset(Assets.iconsAdmissionHistoryIcon),
// //       ),
// //     );
// //   }
// // }
// //
// // class _Clipper extends CustomClipper<Path> {
// //   _Clipper({required this.svgPath, this.offset = Offset.zero});
// //
// //   String svgPath;
// //   Offset offset;
// //   @override
// //   Path getClip(Size size) {
// //     var path = parseSvgPathData(svgPath);
// //
// //     return path.shift(offset);
// //   }
// //
// //   @override
// //   bool shouldReclip(CustomClipper oldClipper) {
// //     return false;
// //   }
// // }
// //
// // const svgCarPath =
// //     'M35 13.7742L46.9628 1.52606L58.8398 5.97996V17.1147L111.544 13.7742L117.111 50.8899L109.688 55.715C108.575 61.2823 103.75 72.417 93.3574 72.417C82.965 72.417 80.4751 64.3753 80.4751 59.4266C68.1032 55.5913 53.5355 53.8592 39.5397 57.5708C35.0128 76.8252 14.4397 76.0591 12.0741 55.715H0.939362V26.7647L12.0741 17.1147L35.8281 13.7742Z';
// // const svgManPath =
// //     'M50.2647 19.9617C50.6461 5.85163 47.5952 0.703364 38.2521 0.703369C32.0776 2.87051 31.0217 6.36354 30.625 14.0016C30.625 14.0016 27.9555 28.1424 30.625 32.8584C33.2945 37.5744 42.1784 35.788 39.3961 40.7456C36.6138 45.7032 27.9555 63.6268 27.9555 63.6268H22.6165C14.7864 70.572 19.1843 79.9011 12.1293 88.7962C3.01255 100.291 -0.77319 103.733 0.879345 106.911L8.12508 109.199L19.1844 96.8046L12.1293 120.258L15.9428 123.499L22.6165 121.402L32.7224 97.9487L39.3961 104.622C36.5995 110.597 32.2267 122.088 37.108 120.258C43.2097 117.97 54.2865 120.258 66.0909 113.394C75.3267 28.4915 49.8834 34.0719 50.2647 19.9617Z';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
// import 'package:human_body_selector/human_body_selector.dart';
// import 'package:human_body_selector/svg_painter/maps.dart';
// import 'package:mhp_patient/resources/constants.dart';
// import 'package:mhp_patient/utils/message.dart';
// import 'package:mhp_patient/view_model/anatomy_model.dart';
// import 'package:mhp_patient/widgets/custom_appbar_auto_leading_icon.dart';
// import 'package:provider/provider.dart';
// import 'package:zoom_widget/zoom_widget.dart';
//
// // List<HumanBodyFacing> humanBodyFacing = [
// //   HumanBodyFacing(title: "Male Front")
// // ];
// // class HumanBodyFacing{
// //   String title;
// //   HumanBodyFacing({required this.title});
// // }
//
// class AnatomyView2 extends StatefulWidget {
//   const AnatomyView2({Key? key}) : super(key: key);
//
//   @override
//   State<AnatomyView2> createState() => _AnatomyView2State();
// }
//
// class _AnatomyView2State extends State<AnatomyView2> {
//   String _selectedValue = maleFront;
//   bool isFlushBarShowing = false;
//   final GlobalKey flushBarKey = GlobalKey();
//
//   String returnHumanBodyFacing(String selectedValue) {
//     if (selectedValue == maleBack) {
//       return Maps.MALE1;
//     } else if (selectedValue == femaleFront) {
//       return Maps.HUMAN;
//     } else if (selectedValue == femaleBack) {
//       return Maps.HUMAN1;
//     } else {
//       return Maps.MALE;
//     }
//   }
//
//   HumanBodySelector returnBodyFacing(String selectedValue) {
//     if (selectedValue == maleBack) {
//       return HumanBodySelector(
//         key: const ValueKey(maleBack),
//         map: Maps.MALE1,
//         dotColor: Colors.red,
//
//         onChanged: (bodyPart, active) {
//           Messages.flushBarMessage(context,
//               "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
//         },
//         onLevelChanged: (bodyPart) {
//           for (var i in bodyPart) {
//             debugPrint(
//                 "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
//           }
//         },
//         // multiSelect: true,
//         toggle: true,
//         // scale: 5.5,
//         // height: MediaQuery.of(context).size.height - MediaQuery.of(context).a,
//         // width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width - 150,
//       );
//     } else if (selectedValue == femaleFront) {
//       return HumanBodySelector(
//         key: const ValueKey(femaleFront),
//         map: Maps.HUMAN,
//         dotColor: Colors.red,
//
//         onChanged: (bodyPart, active) {
//           Messages.flushBarMessage(context,
//               "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
//         },
//         onLevelChanged: (bodyPart) {
//           for (var i in bodyPart) {
//             debugPrint(
//                 "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
//           }
//         },
//         // multiSelect: true,
//         toggle: true,
//
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width - 150,
//       );
//     } else if (selectedValue == femaleBack) {
//       return HumanBodySelector(
//         key: const ValueKey(femaleBack),
//         map: Maps.HUMAN1,
//         dotColor: Colors.red,
//
//         onChanged: (bodyPart, active) {
//           Messages.flushBarMessage(context,
//               "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
//         },
//         onLevelChanged: (bodyPart) {
//           for (var i in bodyPart) {
//             debugPrint(
//                 "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
//           }
//         },
//         // multiSelect: true,
//         toggle: true,
//
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width - 150,
//       );
//     } else {
//       return HumanBodySelector(
//         key: const ValueKey(maleFront),
//         map: Maps.MALE,
//         dotColor: Colors.red,
//
//         onChanged: (bodyPart, active) {
//           Messages.flushBarMessage(context,
//               "${active?.title} ${active?.id} ${active?.painLevel} ${active?.transformedPath} ${active?.props} ${active?.stringify}");
//         },
//         onLevelChanged: (bodyPart) {
//           for (var i in bodyPart) {
//             debugPrint(
//                 "${i.title} ${i.path} ${i.id} ${i.painLevel} ${i.stringify}");
//           }
//         },
//         // multiSelect: true,
//         toggle: true,
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width - 150,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AnatomyModelView>(context);
//     double width = MediaQuery.of(context).size.width;
//     debugPrint("Width: $width}");
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CustomAutoLeadingIcon(),
//         actions: [
//           DropdownButton(
//             value: _selectedValue,
//             items: const [
//               DropdownMenuItem(
//                 value: maleFront,
//                 child: Text(
//                   maleFront,
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: maleBack,
//                 child: Text(
//                   maleBack,
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: femaleFront,
//                 child: Text(
//                   femaleFront,
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: femaleBack,
//                 child: Text(
//                   femaleBack,
//                 ),
//               ),
//             ],
//             onChanged: (value) {
//               if (value is String) {
//                 // provider.setSelectedValue(value);
//                 setState(() {
//                   _selectedValue = value;
//                 });
//               }
//             },
//           ),
//           SizedBox(
//             width: kPadding.w,
//           ),
//         ],
//       ),
//       body: Zoom(
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
//
//               debugPrint(provider.flushBarState.toString());
//
//               if (provider.flushBarState == 0) {
//                 context.router.pop().then((value) => Future.delayed(
//                         const Duration(milliseconds: 1500))
//                     .then((value) => Messages.flushBarWithOption(
//                           context,
//                           child: SizedBox(
//                             height: 300.h,
//                             width: double.infinity,
//                             child: StatefulBuilder(
//                               builder: (context, setState) => GridView.builder(
//                                 itemCount: diseasesList.length,
//                                 itemBuilder: (context, index) {
//                                   return Card(
//                                     // child: RadioListTile(
//                                     //     title: Text("Diseases ${index + 1}"),
//                                     //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
//                                     child: CheckboxListTile(
//                                       controlAffinity:
//                                           ListTileControlAffinity.leading,
//                                       title: Text(
//                                         diseasesList[index].title,
//                                         style: const TextStyle(),
//                                       ),
//                                       value: diseasesList[index].selected,
//                                       onChanged: (bool? value) {
//                                         if (value != null) {
//                                           diseasesList[index].selected = value;
//                                           setState(
//                                             () {},
//                                           );
//                                         }
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 gridDelegate: FlutterzillaFixedGridView(
//                                     crossAxisCount: 2,
//                                     height: 50.h,
//                                     mainAxisSpacing: 10.w,
//                                     crossAxisSpacing: 10.h),
//                               ),
//                             ),
//                           ),
//                         ),),);
//               } else {
//                 Future.delayed(const Duration(milliseconds: 500)).then(
//                   (value) => Messages.flushBarWithOption(
//                     context,
//                     child: SizedBox(
//                       height: 300.h,
//                       width: double.infinity,
//                       child: StatefulBuilder(
//                         builder: (context, setState) => GridView.builder(
//                           itemCount: diseasesList.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               // child: RadioListTile(
//                               //     title: Text("Diseases ${index + 1}"),
//                               //     value: index, groupValue: value, onChanged: (ind) => setState(() => value = ind!)),
//                               child: CheckboxListTile(
//                                 controlAffinity:
//                                     ListTileControlAffinity.leading,
//                                 title: Text(
//                                   diseasesList[index].title,
//                                   style: const TextStyle(),
//                                 ),
//                                 value: diseasesList[index].selected,
//                                 onChanged: (bool? value) {
//                                   if (value != null) {
//                                     diseasesList[index].selected = value;
//                                     setState(
//                                       () {},
//                                     );
//                                   }
//                                 },
//                               ),
//                             );
//                           },
//                           gridDelegate: FlutterzillaFixedGridView(
//                               crossAxisCount: 2,
//                               height: 50.h,
//                               mainAxisSpacing: 10.w,
//                               crossAxisSpacing: 10.h),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
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
//     );
//   }
// }
//
// List<DiseasesModel> diseasesList =
// [
//   DiseasesModel(title: "Head"),
//   DiseasesModel(title: "head1"),
//   DiseasesModel(title: "Head2"),
//   DiseasesModel(title: "Head3"),
//   DiseasesModel(title: "Head4"),
//   DiseasesModel(title: "Head5"),
//   DiseasesModel(title: "Head6"),
//   DiseasesModel(title: "Head7"),
//   DiseasesModel(title: "Head8"),
//   DiseasesModel(title: "Head9"),
// ];
//
// class DiseasesModel {
//   String title;
//   bool selected;
//   DiseasesModel({required this.title, this.selected = false});
// }
//
