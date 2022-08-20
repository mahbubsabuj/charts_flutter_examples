import 'package:flutter/material.dart';
import '../widgets/time_series/simple.dart';

class TimeSeriesCharts extends StatelessWidget {
  const TimeSeriesCharts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Series Charts"),
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
          ],
        ),
      ),
    );
  }
}
