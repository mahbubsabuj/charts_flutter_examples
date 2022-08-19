import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../models/random_sales_data.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  List<charts.Series<RandomSalesData, int>> _chartData = [];
  RandomSalesData generateRandomData(int year) {
    return RandomSalesData(year: year, sales: Random().nextInt(5000));
  }
  static List<charts.Series<RandomSalesData, int>> _prepareChartData() {
    List<RandomSalesData> data = [];
    for (int year = 1; year <= 20; ++year) {
      data.add(
        RandomSalesData(
          year: year,
          sales: Random().nextInt(5000),
        ),
      );
    }
    return [
      charts.Series<RandomSalesData, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
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
    return charts.LineChart(
      _chartData,
      animate: true,
      animationDuration: const Duration(milliseconds: 500),
      defaultRenderer: charts.LineRendererConfig(includePoints: true),
      behaviors: [
        charts.ChartTitle(
          'Points Chart',
        ),
      ],
    );
  }
}
