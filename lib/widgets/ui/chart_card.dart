import 'package:charts_flutter_examples/widgets/fl_line/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    Key? key,
    required this.title,
    required this.unitValue,
    required this.unitName,
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.height,
    required this.width,
    required this.gradientColors,
    required this.chartData,
    required this.showTitle,
  }) : super(key: key);
  final String title;
  final String unitValue;
  final String unitName;
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final double height;
  final double width;
  final bool showTitle;
  final List<FlSpot> chartData;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.8,
                      color: Colors.grey.shade800),
                ),
                Icon(Icons.more_vert, color: Colors.grey.shade500),
              ],
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: gradientColors),
              border: Border(
                left: BorderSide(width: 5, color: borderColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(icon, color: iconColor),
                  const SizedBox(
                    width: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: unitValue,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' $unitName',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12.8,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: LineChartExample(
                key: key,
                showBottomTitle: showTitle,
                chartData: chartData,
              ),
            ),
          )
        ],
      ),
    );
  }
}
