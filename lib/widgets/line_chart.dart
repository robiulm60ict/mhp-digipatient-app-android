import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomLineChart> {

//   List<double> systolicBpList = [];
//   List<double> diastolicBpList = [];
//   DateTime currentDate = DateTime.now();
//   List<num> oneS = [];
//   List<num> twoS = [];
//   List<num> threeS = [];
//   List<num> fourS = [];
//   List<num> fiveS = [];
//   List<num> sixS = [];
//   List<num> sevenS = [];
//   List<num> eightS = [];
//   List<num> nineS = [];
//   List<num> tenS = [];
//   List<num> elevenS = [];
//   List<num> twelveS = [];
//
//   /// Diastolic BP
//
//   List<num> oneD = [];
//   List<num> twoD = [];
//   List<num> threeD = [];
//   List<num> fourD = [];
//   List<num> fiveD = [];
//   List<num> sixD = [];
//   List<num> sevenD = [];
//   List<num> eightD = [];
//   List<num> nineD = [];
//   List<num> tenD = [];
//   List<num> elevenD = [];
//   List<num> twelveD = [];
//
//   @override
//   void initState() {
//     super.initState();
// getVitals();
//   }
//
//   getVitals(){
//     oneS.clear();
//     oneD.clear();
//     twoD.clear();
//     twoS.clear();
//     threeS.clear();
//     threeD.clear();
//     fourS.clear();
//     fourD.clear();
//     fiveS.clear();
//     fiveD.clear();
//     sixD.clear();
//     sixS.clear();
//     sevenD.clear();
//     sevenS.clear();
//     eightD.clear();
//     eightS.clear();
//     nineD.clear();
//     nineS.clear();
//     tenD.clear();
//     tenS.clear();
//     elevenD.clear();
//     elevenS.clear();
//     twelveS.clear();
//     twelveD.clear();
//
//     context.read<MyRecordViewModel>().vitalsList.first.bpArray?.forEach((element) {
//       separateData(element);
//       systolicBpList.clear();
//       diastolicBpList.clear();
//       addDataToList();
//     });
//   }
//
//   addDataToList(){
//
//     systolicBpList.add(getAverage(oneS));
//     systolicBpList.add(getAverage(twoS));
//     systolicBpList.add(getAverage(threeS));
//     systolicBpList.add(getAverage(fourS));
//     systolicBpList.add(getAverage(fiveS));
//     systolicBpList.add(getAverage(sixS));
//     systolicBpList.add(getAverage(sevenS));
//     systolicBpList.add(getAverage(eightS));
//     systolicBpList.add(getAverage(nineS));
//     systolicBpList.add(getAverage(tenS));
//     systolicBpList.add(getAverage(elevenS));
//     systolicBpList.add(getAverage(twelveS));
//
//     /// D
//     diastolicBpList.add(getAverage(oneD));
//     diastolicBpList.add(getAverage(twoD));
//     diastolicBpList.add(getAverage(threeD));
//     diastolicBpList.add(getAverage(fourD));
//     diastolicBpList.add(getAverage(fiveD));
//     diastolicBpList.add(getAverage(sixD));
//     diastolicBpList.add(getAverage(sevenD));
//     diastolicBpList.add(getAverage(eightD));
//     diastolicBpList.add(getAverage(nineD));
//     diastolicBpList.add(getAverage(tenD));
//     diastolicBpList.add(getAverage(elevenD));
//     diastolicBpList.add(getAverage(twelveD));
//
//   }
//   double getAverage(List<num> numbers){
//     double sum = numbers.fold(0, (previousValue, element) => previousValue + element);
//     if(sum != 0){
//       double average = sum / numbers.length;
// return average;
//     }else{
//       return 0;
//
//     }
//   }
//   separateData(BpArray el){
//
//     DateTime date = getDateTime(el.createdAt.toString());
//     if(date.year == currentDate.year && date.month == 1){
//       oneS.add(el.systolic!);
//       oneD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 2){
//       twoS.add(el.systolic!);
//       twoD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 3){
//       threeS.add(el.systolic!);
//       threeD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 4){
//       fourS.add(el.systolic!);
//       fourD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 5){
//       fiveS.add(el.systolic!);
//       fiveD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 6){
//       sixS.add(el.systolic!);
//       sixD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 7){
//       sevenS.add(el.systolic!);
//       sevenD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 8){
//       eightS.add(el.systolic!);
//       eightD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 9){
//       nineS.add(el.systolic!);
//       nineD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 10){
//       tenS.add(el.systolic!);
//       tenD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 11){
//       elevenS.add(el.systolic!);
//       elevenD.add(el.diastolic!);
//     }else if(date.year == currentDate.year && date.month == 12){
//       twelveS.add(el.systolic!);
//       twelveD.add(el.diastolic!);
//     }
//
//   }
//
//
//   DateTime getDateTime(String? date){
//     DateTime? dateObject = DateTime.tryParse(date ?? "");
//     if (dateObject != null) {
//       return dateObject;
//     } else {
//       return DateTime.now();
//     }}
  @override
  Widget build(BuildContext context) {
    final vitals = Provider.of<MyRecordViewModel>(context);
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white,
        lineTouchData: LineTouchData(
          enabled: false,
        // getTouchedSpotIndicator: (barData, spotIndexes) => ,
        ),
        lineBarsData: [
          LineChartBarData(
            spots: vitals.vitalsList.first.bpArray
                ?.asMap()
                .entries
                .map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.systolic!.toDouble());
            }).toList(),
            isCurved: true,
            color: AppColors.primaryColor,
            barWidth: 4,

            dotData: FlDotData(show: true,
              getDotPainter: (p0, p1, p2, p3) => p0.x == 5 ? FlDotCirclePainter(strokeWidth: 6, color: AppColors.primaryColor, strokeColor: AppColors.primaryColor) : FlDotCirclePainter(),
            ),
          ),
          LineChartBarData(
            spots: vitals.vitalsList.first.bpArray
                ?.asMap()
                .entries
                .map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.diastolic!.toDouble());
            }).toList(),
            isCurved: true,
            color: Colors.red,
            barWidth: 4,
            dotData: FlDotData(show: false,
            ),
          ),
        ],
        // minY: 0,
        // maxY: 12,
        // minX: 0,
        // maxX: 12,
        gridData: FlGridData(
          show: true,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
          ),),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
            )
          )
        ),
      ),
    );
  }
  }

  class CustomLineChartAll extends StatefulWidget {
    const CustomLineChartAll({Key? key, required this.selected}) : super(key: key);
    final String? selected;

  @override
  State<CustomLineChartAll> createState() => _CustomLineChartAllState();
}

class _CustomLineChartAllState extends State<CustomLineChartAll> {
  List<PatientsVs> vitalsList = [];

  @override
  void initState() {
    super.initState();
    // vitalsList = context.read<MyRecordViewModel>().vitalsList.first.vsArray!.where((element) => element.patientsVs?.first.name?.toLowerCase() == widget.selected).toList();
  getPatientArray();
    debugPrint("-------------------------${vitalsList.length}");
  }

  getPatientArray(){
    for(var i = 0; i<context.read<MyRecordViewModel>().vitalsList.first.vsArray!.length; i++){
      if(
      context.read<MyRecordViewModel>().vitalsList.first.vsArray![i].patientsVs?.first.name.toString().toLowerCase() == widget.selected){
        vitalsList = context.read<MyRecordViewModel>().vitalsList.first.vsArray![i].patientsVs!;
      setState(() {

      });
      }

    }
  }
    @override
    Widget build(BuildContext context) {
      final vitals = Provider.of<MyRecordViewModel>(context);
      return LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          lineTouchData: LineTouchData(
            enabled: false,
            // getTouchedSpotIndicator: (barData, spotIndexes) => ,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: vitalsList
                  .asMap()
                  .entries
                  .map((entry) {
                return FlSpot(entry.key.toDouble(), double.tryParse(entry.value.toString() ?? "0") ?? 0);
              }).toList(),
              isCurved: true,
              color: AppColors.primaryColor,
              barWidth: 4,

              dotData: FlDotData(show: true,
                getDotPainter: (p0, p1, p2, p3) => p0.x == 5 ? FlDotCirclePainter(strokeWidth: 6, color: AppColors.primaryColor, strokeColor: AppColors.primaryColor) : FlDotCirclePainter(),
              ),
            ),
          ],
          // minY: 0,
          // maxY: 12,
          // minX: 0,
          // maxX: 12,
          gridData: FlGridData(
            show: true,
          ),
          titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
                ),),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
                  )
              )
          ),
        ),
      );
    }
}
