import 'package:charts_flutter_examples/bloc/counter_bloc.dart';
import 'package:charts_flutter_examples/routes/bar_charts.dart';
import 'package:charts_flutter_examples/routes/combo_charts.dart';
import 'package:charts_flutter_examples/routes/fl_charts.dart';
import 'package:charts_flutter_examples/routes/line_charts.dart';
import 'package:charts_flutter_examples/routes/pie_charts.dart';
import 'package:charts_flutter_examples/routes/scatter_plot_charts.dart';
import 'package:charts_flutter_examples/routes/time_series_charts.dart';
import 'package:charts_flutter_examples/widgets/chart_tile.dart';
import 'package:charts_flutter_examples/widgets/ui/bloc_counter_example.dart';
import 'package:charts_flutter_examples/widgets/ui/edit_profile.dart';
import 'package:charts_flutter_examples/widgets/ui/hawle_chart_page.dart';
import 'package:charts_flutter_examples/widgets/ui/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HawleChartPage(),
              ),
            ),
            icon: const Icon(Icons.bar_chart),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<CounterBloc>(
                      create: (context) => CounterBloc(), child: Counter())),
            ),
            icon: const Icon(Icons.pattern),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ),
            ),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyOTP(),
              ),
            ),
            icon: const Icon(Icons.domain_verification),
          ),
        ],
        title: const Text("Charts Flutter Examples"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            ChartTile(
              title: 'FL Charts',
              icon: Icons.pie_chart,
              navigate: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FLCharts(),
                ),
              ),
            ),
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
            ChartTile(
              title: 'UI',
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
