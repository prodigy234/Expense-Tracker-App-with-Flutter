import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makedGroupData(2, 2);
          case 3:
            return makedGroupData(3, 4.5);
          case 4:
            return makedGroupData(4, 3.8);
          case 5:
            return makedGroupData(5, 1.5);
          case 6:
            return makedGroupData(6, 4);
          case 7:
            return makedGroupData(7, 3.8);
          default:
            return throw Error();
        }
  });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTiles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    TextStyle style = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('01', style: style);
        break;
      case 1:
        text = Text('02', style: style);
        break;
      case 2:
        text = Text('03', style: style);
        break;
      case 3:
        text = Text('04', style: style);
        break;
      case 4:
        text = Text('05', style: style);
        break;
      case 5:
        text = Text('06', style: style);
        break;
      case 6:
        text = Text('07', style: style);
        break;
      case 7:
        text = Text('08', style: style);
        break;
      default:
        text = Text('', style: style);
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 16, child: text);
  }

  Widget leftTiles(double value, TitleMeta meta) {
    TextStyle style = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = 'NGN 1K';
    } else if (value == 2) {
      text = 'NGN 2K';
    } else if (value == 3) {
      text = 'NGN 3K';
    } else if (value == 4) {
      text = 'NGN 4K';
    } else if (value == 5) {
      text = 'NGN 5K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
