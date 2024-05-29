import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MyPage(),
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(sections: [
        PieChartSectionData(
            badgeWidget: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.ice_skating,
                ),
                Text('test 1')
              ],
            ),
            value: 1,
            showTitle: true,
            color: Colors.yellow,
            titleStyle: const TextStyle(color: Colors.white),
            radius: 50),
        PieChartSectionData(
            value: 1,
            title: 'test',
            showTitle: true,
            color: Colors.red,
            titleStyle: const TextStyle(color: Colors.white),
            radius: 60),
        PieChartSectionData(
            value: 1,
            title: 'test',
            showTitle: true,
            color: Colors.green,
            titleStyle: const TextStyle(color: Colors.white),
            radius: 70),
      ]),
    );
  }
}
