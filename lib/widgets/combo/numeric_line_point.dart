import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/random_sales_data.dart';
import 'package:flutter/material.dart';

class NumericLinePoint extends StatefulWidget {
  const NumericLinePoint({Key? key}) : super(key: key);

  @override
  State<NumericLinePoint> createState() => _NumericLinePointState();
}

class _NumericLinePointState extends State<NumericLinePoint> {
  List<charts.Series<RandomSalesData, int>> _chartData = [];
  static List<charts.Series<RandomSalesData, int>> _prepareChartData() {
    List<RandomSalesData> bangladesh = [], india = [], nepal = [];
    for (int year = 1995; year <= 2022; ++year) {
      bangladesh.add(
        RandomSalesData(
          year: year,
          sales: Random().nextInt(5000),
        ),
      );
      india.add(
        RandomSalesData(
          year: year,
          sales: Random().nextInt(5000),
        ),
      );
      nepal.add(
        RandomSalesData(
          year: year,
          sales: Random().nextInt(5000),
        ),
      );
    }
    return [
      charts.Series<RandomSalesData, int>(
        id: 'Bangladesh',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: bangladesh,
      ),
      charts.Series<RandomSalesData, int>(
        id: 'India',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: india,
      )..setAttribute(charts.rendererIdKey, 'IndiaCustomPoint'),
      charts.Series<RandomSalesData, int>(
        id: 'Nepal',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: nepal,
      )..setAttribute(charts.rendererIdKey, 'NepalCustomPoint')
    ];
  }

  @override
  void initState() {
    _chartData = _prepareChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return charts.NumericComboChart(
      _chartData,
      animate: false,
      defaultInteractions: true,
      animationDuration: const Duration(milliseconds: 500),
      defaultRenderer: charts.LineRendererConfig(),
      domainAxis: const charts.NumericAxisSpec(
          viewport: charts.NumericExtents(1995, 1999)),
      customSeriesRenderers: [
        charts.PointRendererConfig(customRendererId: 'IndiaCustomPoint'),
        charts.PointRendererConfig(customRendererId: 'NepalCustomPoint'),
      ],
      behaviors: [
        charts.ChartTitle(
          'Numeric Line Bar Combo Chart',
        ),
        charts.PanAndZoomBehavior(),
      ],
    );
  }
}
