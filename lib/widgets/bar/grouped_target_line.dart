import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/sales.dart';
import 'package:flutter/material.dart';

class GroupedTargetLine extends StatefulWidget {
  const GroupedTargetLine({Key? key}) : super(key: key);

  @override
  State<GroupedTargetLine> createState() => _GroupedTargetLineState();
}

class _GroupedTargetLineState extends State<GroupedTargetLine> {
  List<charts.Series<Sales, String>> _chartData = [];
  Sales generateRandomData(int year) {
    return Sales(year: year.toString(), sales: Random().nextInt(5000));
  }

  List<charts.Series<Sales, String>> _prepareChartData() {
    List<Sales> bangladesh = [],
        india = [],
        nepal = [],
        bangladeshTarget = [],
        indiaTarget = [],
        nepalTarget = [];
    for (int year = 2016; year <= 2022; ++year) {
      bangladesh.add(generateRandomData(year));
      india.add(generateRandomData(year));
      nepal.add(generateRandomData(year));
      bangladeshTarget.add(generateRandomData(year));
      indiaTarget.add(generateRandomData(year));
      nepalTarget.add(generateRandomData(year));
    }
    return [
      charts.Series<Sales, String>(
        id: 'Bangladesh',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: bangladesh,
      ),
      charts.Series<Sales, String>(
        id: 'India',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: india,
      ),
      charts.Series<Sales, String>(
        id: 'Nepal',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: nepal,
      ),
      charts.Series<Sales, String>(
        id: 'Bangladesh Target Line',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: bangladeshTarget,
      )..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      charts.Series<Sales, String>(
        id: 'India Target Line',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: indiaTarget,
      )..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      charts.Series<Sales, String>(
        id: 'Nepal Target Line',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: nepalTarget,
      )..setAttribute(charts.rendererIdKey, 'customTargetLine')
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
      barGroupingType: charts.BarGroupingType.grouped,
      customSeriesRenderers: [
        charts.BarTargetLineRendererConfig<String>(
          customRendererId: 'customTargetLine',
          groupingType: charts.BarGroupingType.grouped,
        ),
      ],
      behaviors: [
        charts.ChartTitle(
          'Grouped Target Line Chart',
        )
      ],
    );
  }
}
