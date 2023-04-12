import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/my_medicine_view_model/my_medicine_view_model.dart';
import '../../widgets/back_button.dart';

class RXDetailView extends StatefulWidget {
  const RXDetailView({Key? key, required this.title, required this.isCurrentRxView}) : super(key: key);
  final String title;
  final bool isCurrentRxView;

  @override
  State<RXDetailView> createState() => _RXDetailViewState();
}

class _RXDetailViewState extends State<RXDetailView> {

  @override
  void initState() {
    super.initState();
    getRx();
  }
  getRx(){
    if(widget.isCurrentRxView){
      context.read<MyMedicineViewModel>().getCurrentRx(context);
    }else{
      context.read<MyMedicineViewModel>().getPastRx(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    final mmVm = Provider.of<MyMedicineViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(widget.title, style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: mmVm.isCurrentRxLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
    padding: EdgeInsets.all(15.r),
    itemCount: mmVm.drugList.length,
    itemBuilder: (context, index) {
    final drugs = mmVm.drugList[index];
    return Padding(
    padding:  EdgeInsets.only(bottom: 15.0.h),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Align(
    alignment: Alignment.centerLeft,
    child: Text(" Medicine ${index + 1}", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF606060)),)),
    Card(
    color: Colors.white,
    child: Table(
    border: TableBorder.all(color: Colors.grey),
    children: [
    TableRow(
    children: [
    IntrinsicHeight(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(child: Text("Drugs Name", style: TextStyle(fontSize: 12.sp, color: Color(0xFF8A8A8A)), )),
    SizedBox(width: 5.w,),
    const VerticalDivider(color: Colors.grey, ),
    SizedBox(width: 5.w,),
    Expanded(flex: 3, child: Text("${drugs.drugName}", style:  TextStyle(fontSize: 12.sp, color: Color(0xFF3D3D3D)), )),
    ],
    ),
    ),
    ),
    ]),
    TableRow(
    children: [
    IntrinsicHeight(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(child: Text("Dose", style: TextStyle(fontSize: 12.sp, color: Color(0xFF8A8A8A)), )),
    SizedBox(width: 5.w,),
    const VerticalDivider(color: Colors.grey, ),
    SizedBox(width: 5.w,),
    Expanded(flex: 3, child: Text("${drugs.dose}", style:  TextStyle(fontSize: 12.sp, color: Color(0xFF3D3D3D)), )),
    ],
    ),
    ),
    ),
    ]),
    TableRow(
    children: [
    IntrinsicHeight(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(child: Text("Frequency", style: TextStyle(fontSize: 12.sp, color: Color(0xFF8A8A8A)), )),
    SizedBox(width: 5.w,),
    const VerticalDivider(color: Colors.grey, ),
    SizedBox(width: 5.w,),
    Expanded(flex: 3, child: Text("${drugs.frequency}", style:  TextStyle(fontSize: 12.sp, color: Color(0xFF3D3D3D)), )),
    ],
    ),
    ),
    ),
    ]),
    TableRow(
    children: [
    IntrinsicHeight(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(child: Text("Food", style: TextStyle(fontSize: 12.sp, color: Color(0xFF8A8A8A)), )),
    SizedBox(width: 5.w,),
    const VerticalDivider(color: Colors.grey, ),
    SizedBox(width: 5.w,),
    Expanded(flex: 3, child: Text("${drugs.food}", style:  TextStyle(fontSize: 12.sp, color: Color(0xFF3D3D3D)), )),
    ],
    ),
    ),
    ),
    ]),
    TableRow(
    children: [
    IntrinsicHeight(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(child: Text("Quantity", style: TextStyle(fontSize: 12.sp, color: Color(0xFF8A8A8A)), )),
    SizedBox(width: 5.w,),
    const VerticalDivider(color: Colors.grey, ),
    SizedBox(width: 5.w,),
    Expanded(flex: 3, child: Text("${drugs.quantity}", style:  TextStyle(fontSize: 12.sp, color: Color(0xFF3D3D3D)), )),
    ],
    ),
    ),
    ),
    ]),

    ],
    )
    ),
    ],
    ),
    );}),
    );
  }
}
