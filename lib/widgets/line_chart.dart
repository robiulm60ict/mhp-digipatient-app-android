import 'package:digi_patient/resources/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomLineChart> {

  List<double> data = [0, 5, 2, 10, 4, 8, 3, 6, 7];
  List<double> data2 = [0, 4, 1, 4, 10, 8, 6, 9, 2];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white,
        lineTouchData: LineTouchData(
          enabled: false,
        // getTouchedSpotIndicator: (barData, spotIndexes) => ,
        ),
        lineBarsData: [
          LineChartBarData(
            spots: data
                .asMap()
                .entries
                .map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value);
            }).toList(),
            isCurved: true,
            color: AppColors.primaryColor,
            barWidth: 4,

            dotData: FlDotData(show: true,
              getDotPainter: (p0, p1, p2, p3) => p0.x == 5 ? FlDotCirclePainter(strokeWidth: 6, color: AppColors.primaryColor, strokeColor: AppColors.primaryColor) : FlDotCirclePainter(),
            ),
          ),
          LineChartBarData(
            spots: data2
                .asMap()
                .entries
                .map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value);
            }).toList(),
            isCurved: true,
            color: Colors.red,
            barWidth: 4,
            dotData: FlDotData(show: false,
            ),
          ),
        ],
        minY: 0,
        maxY: 10,
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