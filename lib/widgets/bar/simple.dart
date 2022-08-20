import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/sales.dart';
import 'package:flutter/material.dart';

class Simple extends StatefulWidget {
  const Simple({Key? key}) : super(key: key);

  @override
  State<Simple> createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  List<charts.Series<Sales, String>> _chartData = [];
  static List<charts.Series<Sales, String>> _prepareChartData() {
    List<Sales> data = [];
    for (int year = 2016; year <= 2022; ++year) {
      data.add(
        Sales(
          year: year.toString(),
          sales: Random().nextInt(5000),
        ),
      );
    }
    return [
      charts.Series<Sales, String>(
        id: 'Sales A',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: data,
      )..setAttribute(charts.measureAxisIdKey, 'secondaryTick'),
      charts.Series<Sales, String>(
        id: 'Sales B',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  void initState() {
    _chartData = _prepareChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFF51DE93), Color(0xFFFFB540), Color(0xFFFA4169)],
          stops: [
            0.0,
            0.5,
            1.0,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: charts.BarChart(
        _chartData,
        animate: true,
        defaultInteractions: true,
        animationDuration: const Duration(milliseconds: 500),
        defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(5),
        ),
        primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
        ),
        // secondaryMeasureAxis: const charts.NumericAxisSpec(
        //   tickProviderSpec:
        //       charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
        // ),
        behaviors: [
          charts.ChartTitle(
            'Simple Bar Chart',
          )
        ],
      ),
    );
  }
}
