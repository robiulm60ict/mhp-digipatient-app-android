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
                !.asMap()
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
                !.asMap()
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
    const CustomLineChartAll({Key? key,  required this.patientVsList}) : super(key: key);
    // final String? selected;
    final List<PatientsVs> patientVsList;

  @override
  State<CustomLineChartAll> createState() => _CustomLineChartAllState();
}

class _CustomLineChartAllState extends State<CustomLineChartAll> {
  List<PatientsVs> vitalsList = [];

  @override
  void initState() {
    super.initState();
    // vitalsList = context.read<MyRecordViewModel>().vitalsList.first.vsArray!.where((element) => element.patientsVs?.first.name?.toLowerCase() == widget.selected).toList();
  // getPatientArray();
    debugPrint("-------------------------${vitalsList.length}");
  }

  // getPatientArray(){
  //   for(var i = 0; i<context.read<MyRecordViewModel>().vitalsList.first.vsArray!.length; i++){
  //     if(
  //     context.read<MyRecordViewModel>().vitalsList.first.vsArray![i].patientsVs?.first.name.toString().toLowerCase() == widget.selected){
  //       vitalsList = context.read<MyRecordViewModel>().vitalsList.first.vsArray![i].patientsVs!;
  //     setState(() {
  //
  //     });
  //     }
  //
  //   }
  // }
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
            widget.patientVsList.reversed.first.name.toString() ==
                "Blood Pressure"
                ? LineChartBarData(
              spots: List.generate(
                  widget.patientVsList.length,
                      (index) => FlSpot(
                      index.toDouble(),
                      double.parse(widget.patientVsList[index].value
                          .toString()
                          .split('/')
                          .first))),
              isCurved: true,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
              color: Colors.green,
              barWidth: 4,
            )
                : LineChartBarData(
              // spots: List.generate(
              //     widget.patientVsList.length,
              //         (index) => FlSpot(
              //         index.toDouble(),
              //         double.parse(widget.patientVsList[index].value
              //             .toString()
              //             .split('/')
              //             .first))),
              spots: List.generate( widget.patientVsList.length,
                      (index) => FlSpot(index.toDouble(), double.parse( widget.patientVsList.reversed.first.name.toString() ==
                      "Blood Pressure"? widget.patientVsList[index].value.toString().split('/').first:widget.patientVsList[index].value.toString().split('').first))),
              isCurved: true,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
              color: Colors.yellow,
              barWidth: 4,
            ),
            widget.patientVsList.reversed.first.name.toString() ==
                "Blood Pressure"
                ? LineChartBarData(
              spots: List.generate(
                  widget.patientVsList.length,
                      (index) => FlSpot(
                      index.toDouble(),
                      double.parse(widget.patientVsList[index].value
                          .toString()
                          .split('/')
                          .last.toString()))),
              isCurved: true,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
              color: Colors.red,
              barWidth: 4,
            )
                :  LineChartBarData(),

            // _buildLineChartBar(systolicData, Colors.blue),
            // _buildLineChartBar2(systolicData, Colors.red),
            // LineChartBarData(
            //   // spots: reverseSpots(spots2, minSpotY, double.tryParse(value.value.toString().split("/").last ?? "0") ??
            //   //               0),
            //   // spots: widget.patientVsList.reversed.first.name.toString() ==
            //   //         "Blood Pressure"
            //   //     ? widget.patientVsList.asMap().entries.map((entry) {
            //   //         return reverseSpots()
            //   //
            //   //           // FlSpot(
            //   //           //   entry.key.toDouble(),
            //   //           //
            //   //           //   double.tryParse(entry.value.value.toString().split("/").last ?? "0") ??
            //   //           //       0);
            //   //       }).toList()
            //   //     : widget.patientVsList.asMap().entries.map((entry) {
            //   //         return FlSpot(
            //   //             entry.key.toDouble(),
            //   //             double.tryParse(entry.value.value.toString() ?? "0") ??
            //   //                 0);
            //   //       }).toList(),
            //   isCurved: true,
            //   color: AppColors.primaryColor,
            //   barWidth: 4,
            //   dotData: FlDotData(
            //     show: true,
            //     getDotPainter: (p0, p1, p2, p3) => p0.x == 5
            //         ? FlDotCirclePainter(
            //             strokeWidth: 6,
            //             color: AppColors.primaryColor,
            //             strokeColor: AppColors.primaryColor)
            //         : FlDotCirclePainter(),
            //   ),
            // ),
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
                  getTitlesWidget: (value, meta) =>
                      Text(value.toInt().toString()),
                ),
              ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
                  ))),
        ),
      );
    }
}
