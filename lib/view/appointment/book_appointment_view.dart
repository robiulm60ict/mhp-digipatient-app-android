import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  @override
  void initState() {
    super.initState();
    // context.read<AppointmentViewModel>().setAppointmentDate(context);
  }

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
padding: EdgeInsets.all(20.r),
        children: [
          TextButton(onPressed: ()async{

            await appointmentViewModel.setAppointmentDate(context);

          }, child: Text(appointmentViewModel.monthName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF646464)),)),
          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                appointmentViewModel.weekDayList.length,
                    (index) {
              WeekDayModel avm = appointmentViewModel.weekDayList[index];
              return Expanded(
                child: InkWell(
                onTap: (){
                  appointmentViewModel.selectButton(index);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  color: avm.isSelected ? AppColors.primaryColor : Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(avm.weekName, style: TextStyle(fontSize: 12.sp, color: avm.isSelected ? Colors.white : const Color(0xFF646464)),),
                        Text(avm.day.toString(), style: TextStyle(fontSize: 12.sp, color: avm.isSelected ? Colors.white : const Color(0xFF646464)),),
                      ],
                    ),
                  ),
                ),
            ),
              );
            }
            )
          ),
        ],
      ),
    );
  }
}
