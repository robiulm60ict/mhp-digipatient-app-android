import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appointmentViewModel = Provider.of<AppointmentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
      ),
      body: ListView(
        children: [
          TextButton(onPressed: ()async{

            await appointmentViewModel.setAppointmentDate(context);

          }, child: Text(appointmentViewModel.monthName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF646464)),))
        ],
      ),
    );
  }
}
