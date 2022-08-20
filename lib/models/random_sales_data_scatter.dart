import 'package:charts_flutter/flutter.dart' as charts;

class RandomSalesDataScatter {
  final int year;
  final int sales;
  final double radius;
  final String shape;
  final charts.Color fillColor;
  final double strokeWidth;
  RandomSalesDataScatter(
      {required this.year,
      required this.sales,
      required this.radius,
      required this.shape,
      required this.fillColor,
      required this.strokeWidth});
}
