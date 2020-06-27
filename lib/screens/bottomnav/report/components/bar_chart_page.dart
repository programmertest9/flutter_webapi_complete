import 'package:flutter/material.dart';

import 'bar_chart_sample1.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          width: double.infinity,
        color: Colors.white,
        child: BarChartSample1(),
      ),
    );
  }
}