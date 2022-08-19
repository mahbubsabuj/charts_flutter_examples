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
        id: 'Sales',
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
    return charts.BarChart(
      _chartData,
      animate: true,
      animationDuration: const Duration(milliseconds: 500),
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(5),
      ),
      behaviors: [
        charts.ChartTitle(
          'Simple Bar Chart',
        )
      ],
    );
  }
}
