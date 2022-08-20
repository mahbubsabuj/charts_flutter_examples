import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/scatter_sales_data.dart';
import 'package:flutter/material.dart';

class Simple extends StatefulWidget {
  Simple({Key? key}) : super(key: key);

  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  List<charts.Series<ScatterSalesData, int>> _chartData = [];
  List<charts.Series<ScatterSalesData, int>> _createSampleData() {
    List<ScatterSalesData> salesData = [];
    for (int year = 0; year <= 200; ++year) {
      salesData.add(
        ScatterSalesData(
            year: year,
            sales: Random().nextInt(5000),
            radius: Random().nextDouble() * 5,
            shape: 'circle'),
      );
    }
    const maxMeasure = 5000;
    return [
      charts.Series<ScatterSalesData, int>(
        id: 'Sales',
        colorFn: (ScatterSalesData sales, _) {
          final bucket = sales.sales / maxMeasure;
          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (ScatterSalesData sales, _) => sales.year,
        measureFn: (ScatterSalesData sales, _) => sales.sales,
        radiusPxFn: (ScatterSalesData sales, _) => sales.radius,
        data: salesData,
      )
    ];
  }

  @override
  void initState() {
    _chartData = _createSampleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return charts.ScatterPlotChart(
      _chartData,
      // defaultRenderer: charts.PointRendererConfig<num>(customSymbolRenderers: {
      //   'circle': charts.CircleSymbolRenderer(),
      //   'rect': charts.RectSymbolRenderer(),
      // }),
      animate: true,
      behaviors: [
        charts.ChartTitle('Scatter Chart'),
        charts.SeriesLegend(position: charts.BehaviorPosition.bottom),
      ],
    );
  }
}
