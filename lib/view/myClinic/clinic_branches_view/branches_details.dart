import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class BranchesDetails extends StatefulWidget {
  const BranchesDetails({super.key});

  @override
  State<BranchesDetails> createState() => _BranchesDetailsState();
}

class _BranchesDetailsState extends State<BranchesDetails> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: FloatingActionButton(
          //   mini: true,
          //   backgroundColor: Colors.black26,
          //   elevation: 0,
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.keyboard_arrow_left_rounded),
          // ),
          iconTheme: IconThemeData(color: Colors.black),

          backgroundColor: Colors.white,
          // leading: Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: Image.asset(
          //     Assets.mhplogo,
          //   ),
          // ),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage(Assets.dummy_image),
            ),
            Style.widthdistan_size10,
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border:
                          Border.all(color: AppColors.primary_color, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    "Watch Intro video",
                    textAlign: TextAlign.center,
                    style: Style.alltext_Large_primary,
                  )),
                ),
                Style.distan_size10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 250.w,
                        child: Text(
                          "IBN Sina DHANMONDI BRANCH ,DHAKA, BD",
                          style: Style.alltext_default_balck_blod_dilog,
                        )),
                    Icon(Icons.favorite_border,color: Colors.black,size: 25,),
                  ],
                ),
                Style.distan_size15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Style.widthdistan_size2,
                        Text(
                          "4.1",
                          style: Style.alltext_small_black,
                        ),
                        Text(
                          "(66 reviews)",
                          style: Style.alltext_small_black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        Style.widthdistan_size2,
                        Text(
                          "100 doctors     ",
                          style: Style.alltext_small_black,
                        ),
                      ],
                    ),
                  ],
                ),
                Style.distan_size10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 20,
                        ),
                        Style.widthdistan_size2,
                        Text(
                          "Dhaka ",
                          style: Style.alltext_small_black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.black,
                          size: 20,
                        ),
                        Style.widthdistan_size2,
                        Text(
                          "8 Am to 10 Pm",
                          style: Style.alltext_small_black,
                        ),
                      ],
                    ),
                  ],
                ),
                Style.distan_size10,
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(Assets.dummy_image),
                  ),
                  title: Text("Dr . John K.C"),
                  subtitle: Text("Operation Manager"),
                  trailing: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child:Image.asset("assets/icons/call.png")
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Clinic facilities",
                      style: Style.alltext_Large_black,
                    )
                  ],
                ),                Style.distan_size10,

                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 20,
                    ),
                    Style.widthdistan_size5,
                    Text(
                      "Doctor Chamber",
                      style: Style.alltext_default_balck,
                    )
                  ],
                ),
                Style.distan_size10,
                Row(
                  children: [
                    Icon(
                      Icons.account_tree,
                      color: Colors.black,
                      size: 20,
                    ),
                    Style.widthdistan_size5,
                    Text(
                      "Pathology",
                      style: Style.alltext_default_balck,
                    )
                  ],
                ),
                Style.distan_size5,
                Row(
                  children: [
                    Icon(
                      Icons.computer,
                      color: Colors.black,
                      size: 20,
                    ),
                    Style.widthdistan_size5,
                    Text(
                      "Radiology",
                      style: Style.alltext_default_balck,
                    )
                  ],
                ),
                Style.distan_size10,
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color: Colors.black,
                      size: 20,
                    ),
                    Style.widthdistan_size5,
                    Text(
                      "Free Consultations",
                      style: Style.alltext_default_balck,
                    )
                  ],
                ),
                Style.distan_size5,
                Card(
                  elevation: 0,
                  child: SizedBox(
                    height: 130,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
                Style.distan_size5,
                // Text(
                //   "Nearest public facilities",
                //   style: Style.alltext_default_balck_blod,
                // ),
                //
                // Style.distan_size10,
                //
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(Icons.add_shopping_cart_rounded),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Minimarket"),
                //             Style.distan_size10,
                //             Text("200m"),
                //           ],
                //         )
                //       ],
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(Icons.local_hospital),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Hospital       "),
                //             Style.distan_size10,
                //             Text("200m"),
                //           ],
                //         )
                //       ],
                //     )
                //   ],
                // ),
                // Style.distan_size10,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(Icons.restaurant),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Minimarket"),
                //             Style.distan_size10,
                //             Text("200m"),
                //           ],
                //         )
                //       ],
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(Icons.train),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Train station"),
                //             Style.distan_size10,
                //             Text("200m"),
                //           ],
                //         )
                //       ],
                //     )
                //   ],
                // ),
                Style.distan_size15,
                Text(
                  "About IBN SINA Clinic",
                  style: Style.alltext_default_balck_blod,
                ),
                Style.distan_size15,
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  style: Style.alltext_default_balck,
                ),
                Style.distan_size5,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
