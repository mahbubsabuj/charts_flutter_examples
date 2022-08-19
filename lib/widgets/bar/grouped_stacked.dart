import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/sales.dart';
import 'package:flutter/material.dart';

class GroupedStacked extends StatefulWidget {
  const GroupedStacked({Key? key}) : super(key: key);

  @override
  State<GroupedStacked> createState() => _GroupedStackedState();
}

class _GroupedStackedState extends State<GroupedStacked> {
  List<charts.Series<Sales, String>> _chartData = [];
  static List<charts.Series<Sales, String>> _prepareChartData() {
    List<Sales> bangladesh = [], india = [], nepal = [];
    for (int year = 2016; year <= 2022; ++year) {
      bangladesh.add(
        Sales(
          year: year.toString(),
          sales: Random().nextInt(5000),
        ),
      );
      india.add(
        Sales(
          year: year.toString(),
          sales: Random().nextInt(5000),
        ),
      );
      nepal.add(
        Sales(
          year: year.toString(),
          sales: Random().nextInt(5000),
        ),
      );
    }
    return [
      charts.Series<Sales, String>(
        id: 'Bangladesh',
        seriesCategory: 'A',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: bangladesh,
      ),
      charts.Series<Sales, String>(
        id: 'India',
        seriesCategory: 'A',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: india,
      ),
      charts.Series<Sales, String>(
        id: 'Nepal',
        seriesCategory: 'A',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: nepal,
      ),
      charts.Series<Sales, String>(
        id: 'Bangladesh',
        seriesCategory: 'B',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: bangladesh,
      ),
      charts.Series<Sales, String>(
        id: 'India',
        seriesCategory: 'B',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: india,
      ),
      charts.Series<Sales, String>(
        id: 'Nepal',
        seriesCategory: 'B',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: nepal,
      ),
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
      barGroupingType: charts.BarGroupingType.groupedStacked,
      behaviors: [
        charts.ChartTitle(
          'Grouped Stacked Bar Chart',
        )
      ],
    );
  }
}
