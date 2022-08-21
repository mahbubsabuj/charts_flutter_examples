import 'package:flutter/material.dart';

import 'chart_card.dart';

class HawleChartPage extends StatelessWidget {
  const HawleChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Last Week';
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 63,
            width: 390,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 8, bottom: 8, right: 16),
                  child: Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        // color: Colors.black,
                        spreadRadius: 40,
                        blurRadius: 40,
                      ),
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        height: 47,
                        width: 47,
                        image: NetworkImage(
                            'https://www.hygradewater.co.nz/wp-content/uploads/2019/01/Ozcan-Needle-Valve.jpg'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Needle Valve Özkan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Helvetica Neue'),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "#23CD45SD23O",
                        style: TextStyle(
                            fontSize: 12.8,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Helvetica Neue'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 614,
            width: 390,
            // color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.bar_chart,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SHOWING",
                            style: TextStyle(
                                fontSize: 10.2,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                fontFamily: 'Helvetica Neue'),
                          ),
                          Text(
                            "Data For",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 36,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Padding(
                              padding: EdgeInsets.only(
                                left: 75,
                              ),
                              child: Icon(Icons.expand_more),
                            ),
                            underline: Container(height: 0),
                            dropdownColor: Colors.grey.shade100,
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.8,
                            ),
                            onChanged: (String? newValue) {},
                            items: <String>[
                              'Last Week',
                              'Last Day',
                              'Last Month'
                            ].map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChartCard(
                        title: 'Temperature',
                        unitValue: '10°',
                        unitName: 'c',
                        height: 275,
                        width: 167,
                        icon: Icons.device_thermostat,
                        gradientColors: [
                          Colors.white,
                          Colors.white,
                          Colors.green.shade100,
                        ],
                        iconColor: Colors.green.shade500,
                        borderColor: Colors.green.shade500,
                      ),
                      ChartCard(
                        title: 'Pressure',
                        unitValue: '6',
                        unitName: 'Bar',
                        height: 275,
                        width: 167,
                        icon: Icons.speed,
                        gradientColors: [
                          Colors.white,
                          Colors.white,
                          Colors.red.shade100,
                        ],
                        iconColor: Colors.red.shade500,
                        borderColor: Colors.red.shade500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ChartCard(
                      title: 'Flow Rate',
                      unitValue: '50',
                      unitName: 'L/Min',
                      height: 168,
                      width: 342,
                      icon: Icons.water_drop,
                      gradientColors: [
                        Colors.white,
                        Colors.white,
                        Colors.green.shade100,
                      ],
                      iconColor: Colors.grey.shade700,
                      borderColor: Colors.green.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
