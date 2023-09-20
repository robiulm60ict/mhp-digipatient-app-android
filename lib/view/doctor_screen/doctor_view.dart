import 'package:digi_patient/view_model/doctor_screen_view_model/all_patient_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DoctorHomeView extends StatefulWidget {
  const DoctorHomeView({super.key});

  @override
  State<DoctorHomeView> createState() => _DoctorHomeViewState();
}

class _DoctorHomeViewState extends State<DoctorHomeView> {
  @override
  void initState() {
    super.initState();
    getAllPatients();
  }
  getAllPatients(){
    context.read<DoctorScreenViewModel>().getAllPatientList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Doctor view"),
      ),
      body: Container(),
    );
  }
}

