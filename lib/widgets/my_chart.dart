import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/database.dart';

//https://google.github.io/charts/flutter/example/time_series_charts/end_points_axis

class MyChart extends StatelessWidget {
  const MyChart(this.seriesList, {this.animate});

  factory MyChart.withBMIData(List<BMIModel> list) {
    return MyChart(
      _processBMIData(list),
      // Disable animations for image tests.
      animate: false,
    );
  }

  final List<charts.Series> seriesList;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Configures an axis spec that is configured to render one tick at each
      // end of the axis range, anchored "inside" the axis. The start tick label
      // will be left-aligned with its tick mark, and the end tick label will be
      // right-aligned with its tick mark.
      domainAxis: const charts.EndPointsTimeAxisSpec(),
    );
  }

  static List<charts.Series<BMIModel, DateTime>> _processBMIData(
      List<BMIModel> list) {
    return <charts.Series<BMIModel, DateTime>>[
      charts.Series<BMIModel, DateTime>(
        id: 'BMI',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (BMIModel bmi, _) => bmi.date,
        measureFn: (BMIModel bmi, _) => bmi.bmi,
        data: list,
      )
    ];
  }
}
