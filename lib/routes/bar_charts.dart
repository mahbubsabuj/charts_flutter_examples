import 'package:flutter/material.dart';

import '../widgets/bar/grouped.dart';
import '../widgets/bar/grouped_stacked.dart';
import '../widgets/bar/grouped_target_line.dart';
import '../widgets/bar/horizontal.dart';
import '../widgets/bar/horizontal_bar_label.dart';
import '../widgets/bar/simple.dart';
import '../widgets/bar/spark_bar.dart';
import '../widgets/bar/stacked.dart';
import '../widgets/bar/stacked_horizontal.dart';
import '../widgets/bar/stacked_target_line.dart';

class BarCharts extends StatelessWidget {
  const BarCharts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Charts"),
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
                  child: Simple(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: Stacked(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: Grouped(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: GroupedStacked(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: GroupedTargetLine(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: StackedHorizontal(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: StackedTargetLine(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: Horizontal(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: HorizontalBarLabel(key: key),
                ),
              ),
            ),
            Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: SparkBar(key: key),
                ),
              ),
            ),

            // Card(
            //   elevation: 24,
            //   child: Padding(
            //     padding: const EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 300,
            //       child: charts.BarChart(
            //         _createSampleData(),
            //         animate: false,
            //         behaviors: [
            //           // charts.SeriesLegend(),
            //           charts.PanAndZoomBehavior(),
            //           charts.PanBehavior(),
            //           charts.SlidingViewport(),
            //           charts.ChartTitle(
            //             'Bar Chart with Legend',
            //           ),
            //           charts.DatumLegend(
            //             outsideJustification:
            //                 charts.OutsideJustification.endDrawArea,
            //             cellPadding: const EdgeInsets.all(5),
            //             position: charts.BehaviorPosition.bottom,
            //             desiredMaxColumns: 5,
            //             desiredMaxRows: 5,
            //             insideJustification: charts.InsideJustification.topEnd,
            //             showMeasures: true,
            //             horizontalFirst: true,
            //             entryTextStyle: charts.TextStyleSpec(
            //               color: charts.MaterialPalette.black.darker,
            //               fontSize: 11,
            //             ),
            //           ),
            //         ],
            //         domainAxis: charts.OrdinalAxisSpec(
            //           viewport: charts.OrdinalViewport('Months', 4),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
