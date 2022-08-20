import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../models/random_sales_data.dart';

// class IconRenderer extends charts.SymbolRenderer {
//   final IconData iconData;

//   IconRenderer(this.iconData);

//   @override
//   Widget build(BuildContext context,
//       {required Size size, required Color color, required bool isSelected}) {
//     final Size size;
//     final Color color;
//     final bool isSelected;
//     return SizedBox.fromSize(
//         size: size, child: new Icon(iconData, color: color, size: 12.0));
//   }
// }

class IconRenderer extends charts.CustomSymbolRenderer {
  IconRenderer({required this.iconData});
  final IconData iconData;
  @override
  Widget build(BuildContext context,
      {Color? color, required Size size, bool enabled = true}) {
    return SizedBox.fromSize(
      size: size,
      child: Icon(iconData, color: color, size: 12.0),
    );
  }
}

class StackedArea extends StatefulWidget {
  const StackedArea({Key? key}) : super(key: key);

  @override
  State<StackedArea> createState() => _StackedAreaState();
}

class _StackedAreaState extends State<StackedArea> {
  List<charts.Series<RandomSalesData, int>> _chartData = [];

  RandomSalesData generateRandomData(int year) {
    return RandomSalesData(year: year, sales: Random().nextInt(5000));
  }

  List<charts.Series<RandomSalesData, int>> _prepareChartData() {
    List<RandomSalesData> desktopSalesData = [],
        laptopSalesData = [],
        notebookSalesData = [];
    for (int year = 1; year <= 200; ++year) {
      desktopSalesData.add(generateRandomData(year));
      laptopSalesData.add(generateRandomData(year));
      notebookSalesData.add(generateRandomData(year));
    }
    return [
      charts.Series<RandomSalesData, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        areaColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<RandomSalesData, int>(
        id: 'Laptop',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: laptopSalesData,
      ),
      charts.Series<RandomSalesData, int>(
        id: 'Notebook',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (RandomSalesData sales, _) => sales.year,
        measureFn: (RandomSalesData sales, _) => sales.sales,
        data: notebookSalesData,
      )..setAttribute(charts.rendererIdKey, 'NotebookArea'),
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
      defaultRenderer: charts.LineRendererConfig(
        includeArea: true,
        stacked: true,
        symbolRenderer: IconRenderer(iconData: Icons.circle_notifications),
      ),
      customSeriesRenderers: [
        charts.LineRendererConfig(
          customRendererId: 'NotebookArea',
          symbolRenderer: IconRenderer(iconData: Icons.desk),
        )
      ],
      domainAxis:
          const charts.NumericAxisSpec(viewport: charts.NumericExtents(1, 10)),
      behaviors: [
        charts.ChartTitle(
          'Stacked Area Chart',
        ),
        charts.SeriesLegend(position: charts.BehaviorPosition.bottom),
        charts.PanAndZoomBehavior(panningCompletedCallback: () => print("YES")),
        charts.SlidingViewport(),
      ],
    );
  }
}
