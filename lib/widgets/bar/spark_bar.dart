import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/sales.dart';
import 'package:flutter/material.dart';

class SparkBar extends StatefulWidget {
  const SparkBar({Key? key}) : super(key: key);

  @override
  State<SparkBar> createState() => _SparkBarState();
}

class _SparkBarState extends State<SparkBar> {
  List<charts.Series<Sales, String>> _chartData = [];
  Sales generateRandomData(int year) {
    return Sales(year: year.toString(), sales: Random().nextInt(5000));
  }

  List<charts.Series<Sales, String>> _prepareChartData() {
    List<Sales> data = [];
    for (int year = 2016; year <= 2022; ++year) {
      data.add(generateRandomData(year));
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

      /// Assign a custom style for the measure axis.
      ///
      /// The NoneRenderSpec only draws an axis line (and even that can be hidden
      /// with showAxisLine=false).
      primaryMeasureAxis:
          const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),

      /// This is an OrdinalAxisSpec to match up with BarChart's default
      /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
      /// other charts).
      domainAxis: const charts.OrdinalAxisSpec(
          // Make sure that we draw the domain axis line.
          showAxisLine: true,
          // But don't draw anything else.
          renderSpec: charts.NoneRenderSpec()),

      // With a spark chart we likely don't want large chart margins.
      // 1px is the smallest we can make each margin.
      layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(0),
          topMarginSpec: charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(0)),
      behaviors: [
        charts.ChartTitle(
          'Spark Bar Chart',
        )
      ],
    );
  }
}
