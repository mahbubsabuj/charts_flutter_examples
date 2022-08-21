import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/random_sales_data.dart';
import 'package:flutter/material.dart';

class NumericLineBar extends StatefulWidget {
  const NumericLineBar({Key? key}) : super(key: key);

  @override
  State<NumericLineBar> createState() => _NumericLineBarState();
}

class _NumericLineBarState extends State<NumericLineBar> {
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
      )..setAttribute(charts.rendererIdKey, 'IndiaCustomLine'),
      charts.Series<RandomSalesData, int>(
        id: 'Nepal',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: nepal,
      )..setAttribute(charts.rendererIdKey, 'NepalCustomLine')
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
      defaultRenderer: charts.BarRendererConfig(groupingType: charts.BarGroupingType.grouped),
     domainAxis:
          const charts.NumericAxisSpec(viewport: charts.NumericExtents(1995, 1999)),
      customSeriesRenderers: [
        charts.LineRendererConfig(customRendererId: 'NepalCustomLine'),
        charts.LineRendererConfig(customRendererId: 'IndiaCustomLine'),
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
