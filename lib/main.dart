import 'package:charts_flutter_examples/routes/bar_charts.dart';
import 'package:charts_flutter_examples/routes/combo_charts.dart';
import 'package:charts_flutter_examples/routes/line_charts.dart';
import 'package:charts_flutter_examples/routes/pie_charts.dart';
import 'package:charts_flutter_examples/routes/scatter_plot_charts.dart';
import 'package:charts_flutter_examples/routes/time_series_charts.dart';
import 'package:charts_flutter_examples/widgets/chart_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ChartsHome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ChartsHome extends StatelessWidget {
  const ChartsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          // IconButton(
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Test(),
          //     ),
          //   ),
          //   icon: const Icon(Icons.leaderboard_rounded),
          // ),
        ],
        title: const Text("Charts"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            ChartTile(
              title: 'Bar Charts',
              icon: Icons.bar_chart,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BarCharts(),
                ),
              ),
            ),
            ChartTile(
              title: 'Line Charts',
              icon: Icons.stacked_line_chart,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LineCharts(),
                ),
              ),
            ),
            ChartTile(
              title: 'Pie Charts',
              icon: Icons.pie_chart,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PieCharts(),
                ),
              ),
            ),
            ChartTile(
              title: 'Scatter Plot Charts',
              icon: Icons.scatter_plot,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScatterPlotCharts(),
                ),
              ),
            ),
            ChartTile(
              title: 'Combo Charts',
              icon: Icons.multiline_chart_sharp,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ComboCharts(),
                ),
              ),
            ),
            ChartTile(
              title: 'Time Series Charts',
              icon: Icons.timeline,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TimeSeriesCharts(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
