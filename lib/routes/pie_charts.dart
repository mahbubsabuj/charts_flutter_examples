import 'package:flutter/material.dart';

//Issues

//https://stackoverflow.com/questions/72242596/pie-chart-disappears-when-defaultrenderer-charts-arcrendererconfig-is-added-t
//https://stackoverflow.com/questions/57702624/flutter-googlechart-pie-chart-does-not-render-when-defaultrender-is-set-to-very
//https://stackoverflow.com/questions/70748999/how-to-fix-error-when-creating-a-donut-pie-chart-in-flutter

import '../widgets/pie/simple.dart';

class PieCharts extends StatelessWidget {
  const PieCharts({Key? key}) : super(key: key);
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
          ],
        ),
      ),
    );
  }
}
