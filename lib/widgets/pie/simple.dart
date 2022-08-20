import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../models/random_sales_data.dart';

class Simple extends StatefulWidget {
  const Simple({Key? key}) : super(key: key);

  @override
  State<Simple> createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  List<charts.Series<RandomSalesData, int>> _chartData = [];
  RandomSalesData generateRandomData(int year) {
    return RandomSalesData(year: year, sales: Random().nextInt(5000));
  }

  static List<charts.Series<RandomSalesData, int>> _prepareChartData() {
    List<RandomSalesData> data = [];
    for (int year = 1; year <= 5; ++year) {
      data.add(
        RandomSalesData(
          year: year,
          sales: Random().nextInt(20),
        ),
      );
    }
    return [
      charts.Series<RandomSalesData, int>(
        id: 'Sales',
        // colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        labelAccessorFn: (RandomSalesData row, _) =>
            '${row.year}: ${row.sales}',
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
    return charts.PieChart(
      _chartData,
      animate: true,
      animationDuration: const Duration(milliseconds: 500),
      // defaultRenderer: charts.ArcRendererConfig(
      //   customRendererId: 'SalesCustom',
      //   arcRendererDecorators: [
      //     charts.ArcLabelDecorator(
      //         labelPosition: charts.ArcLabelPosition.outside)
      //   ],
      // ),
      // behaviors: [
      //   charts.ChartTitle(
      //     'Simple Pie Chart',
      //   ),
      // ],
    );
  }
}
