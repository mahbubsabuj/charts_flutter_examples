import 'package:charts_flutter_examples/widgets/fl_charts/fl_bar.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example1.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example2.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example4.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example5.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example6.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_line_chart_example7.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_pie_chart_example1.dart';
import 'package:charts_flutter_examples/widgets/fl_charts/fl_pie_chart_example2.dart';
import 'package:flutter/material.dart';

import '../widgets/fl_charts/fl_line_chart_example3.dart';
import '../widgets/fl_line/line_chart.dart';

class FLCharts extends StatelessWidget {
  const FLCharts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FL Charts"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView(
          children: [
            Card(
              elevation: 24,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: PieChartSample1(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: PieChartSample2(key: key),
                ),
              ),
            ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: BarChartSample1(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample1(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample2(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample3(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample4(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample5(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample6(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: LineChartSample7(key: key),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
