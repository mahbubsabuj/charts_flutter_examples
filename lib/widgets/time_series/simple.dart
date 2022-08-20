import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/time_series_sales.dart';

class Simple extends StatefulWidget {
  const Simple({Key? key}) : super(key: key);

  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  List<charts.Series<TimeSeriesSales, DateTime>> _chartData = [];
  List<TimeSeriesSales> _generateRandomSalesData() {
    List<TimeSeriesSales> _sales = [];
    for (int year = 2010; year <= 2015; ++year) {
      for (int month = 1; month <= 12; ++month) {
        for (int day = 1; day <= 28; ++day) {
          final int sales = Random().nextInt(5000);
          _sales.add(
              TimeSeriesSales(date: DateTime(year, month, day), sales: sales));
        }
      }
    }
    return _sales;
  }

  List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    List<TimeSeriesSales> salesData = _generateRandomSalesData();
    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.date,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        measureLowerBoundFn: (TimeSeriesSales sales, _) => sales.sales - 5,
        measureUpperBoundFn: (TimeSeriesSales sales, _) => sales.sales + 5,
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
    return charts.TimeSeriesChart(
      _chartData,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      // defaultRenderer: charts.BarRendererConfig<DateTime>(),
      domainAxis: charts.DateTimeAxisSpec(
        viewport: charts.DateTimeExtents(
          start: DateTime(2010, 1, 1),
          end: DateTime(2010, 1, 10),
        ),
        tickFormatterSpec: const charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'dd',
            transitionFormat: 'dd MMM',
          ),
        ),
      ),
      // domainAxis: const charts.EndPointsTimeAxisSpec(),
      behaviors: [
        charts.ChartTitle('Simple Time Series Chart'),
        charts.PanAndZoomBehavior(),
      ],
    );
  }
}
