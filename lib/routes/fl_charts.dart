import 'package:flutter/material.dart';

import '../widgets/fl_line/line_chart.dart';

class FLCharts extends StatelessWidget {
  const FLCharts({Key? key}) : super(key: key);
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
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: LineChartExample(key: key),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
