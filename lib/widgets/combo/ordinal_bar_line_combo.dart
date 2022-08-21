import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_examples/models/sales.dart';
import 'package:flutter/material.dart';

class OrdinalBarLineCombo extends StatefulWidget {
  const OrdinalBarLineCombo({Key? key}) : super(key: key);

  @override
  State<OrdinalBarLineCombo> createState() => _OrdinalBarLineComboState();
}

class _OrdinalBarLineComboState extends State<OrdinalBarLineCombo> {
  List<charts.Series<Sales, String>> _chartData = [];
  static List<charts.Series<Sales, String>> _prepareChartData() {
    List<Sales> bangladesh = [], india = [], nepal = [];
    for (int year = 1995; year <= 2022; ++year) {
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
      )..setAttribute(charts.rendererIdKey, 'IndiaCustomLine'),
      charts.Series<Sales, String>(
        id: 'Nepal',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
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
    return charts.OrdinalComboChart(
      _chartData,
      animate: false,
      defaultInteractions: true,
      animationDuration: const Duration(milliseconds: 500),
      defaultRenderer: charts.BarRendererConfig(groupingType: charts.BarGroupingType.grouped),
       domainAxis: charts.OrdinalAxisSpec(
        viewport: charts.OrdinalViewport('Bangladesh', 4),
      ),
      customSeriesRenderers: [
        charts.LineRendererConfig(customRendererId: 'NepalCustomLine'),
        charts.LineRendererConfig(customRendererId: 'IndiaCustomLine'),
      ],
      behaviors: [
        charts.ChartTitle(
          'Ordinal Bar Line Combo Chart',
        ),
        charts.PanAndZoomBehavior(),
      ],
    );
  }
}
