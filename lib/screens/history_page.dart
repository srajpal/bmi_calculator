import 'package:bmi_calculator/shared/calculator.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/database.dart';
import 'package:bmi_calculator/widgets/my_chart.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'BMI History',
              style: TEXT_LARGE,
            ),
          ),
          Expanded(
            child: futureList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}

Widget futureList() {
  return FutureBuilder<dynamic>(
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return Center(
          child: Container(
            child: const CircularProgressIndicator(),
          ),
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: MyChart.withBMIData(snapshot.data),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final BMIModel bmi = snapshot.data[index];
                final String result = Calculator.bmi(bmi.bmi).getResult();
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        bmi.bmi.toStringAsFixed(1),
                        style: TEXT_HISTORY_BMI,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              result,
                              style: TEXT_HISTORY_RESULT,
                            ),
                            Text(
                              bmi.formatDate(),
                              style: TEXT_HISTORY_DATE,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    },
    future: BMIDatabase.db.getAll(),
  );
}
