import 'package:charts_flutter_examples/widgets/combo/numeric_line_bar.dart';
import 'package:charts_flutter_examples/widgets/combo/numeric_line_point.dart';
import 'package:charts_flutter_examples/widgets/combo/ordinal_bar_line_combo.dart';
import 'package:flutter/material.dart';

class ComboCharts extends StatelessWidget {
  const ComboCharts({Key? key}) : super(key: key);
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
                  child: OrdinalBarLineCombo(key: key),
                ),
              ),
            ),
             Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: NumericLineBar(key: key),
                ),
              ),
            ),
              Card(
              elevation: 24,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  child: NumericLinePoint(key: key),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
