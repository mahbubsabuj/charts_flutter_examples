import 'package:charts_flutter_examples/widgets/line/area_line.dart';
import 'package:charts_flutter_examples/widgets/line/dash_pattern.dart';
import 'package:charts_flutter_examples/widgets/line/stacked_area.dart';
import 'package:flutter/material.dart';
import '../widgets/line/points.dart';

class ScatterPlotCharts extends StatelessWidget {
  const ScatterPlotCharts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Line Charts"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView(
          children: [
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: Points(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: StackedArea(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: AreaLine(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: DashPattern(key: key),
                ),
              ),
            ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: GroupedTargetLine(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: StackedHorizontal(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: StackedTargetLine(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: Horizontal(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: HorizontalBarLabel(key: key),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: SparkBar(key: key),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
