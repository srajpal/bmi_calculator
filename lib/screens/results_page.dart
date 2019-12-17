import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/database.dart';
import 'package:bmi_calculator/widgets/my_big_button.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:bmi_calculator/widgets/my_result_button.dart';
import 'package:flutter/material.dart';

Future<void> saveToDB(double bmi) async {
  final BMIModel _bmi = BMIModel(
    date: DateTime.now(),
    bmi: bmi,
  );
  await BMIDatabase.db.insert(_bmi);
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    @required this.bmi,
    @required this.result,
  });

  final double bmi;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(APP_TITLE),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Your Result',
              style: TEXT_LARGE,
            ),
          ),
          MyCard(
            active: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    result.toUpperCase(),
                    style: TEXT_RESULT_CLASSIFICATION,
                  ),
                ),
                Center(
                  child: Text(
                    bmi.toStringAsFixed(1),
                    style: TEXT_RESULT_BMI,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MyResultButton(
                      label: 'Save Results',
                      onPressed: () {
                        saveToDB(bmi);
                        final SnackBar snackBar = SnackBar(
                          content: const Text('BMI saved to history!'),
                          action: SnackBarAction(
                            label: 'View History',
                            onPressed: () {
                              Navigator.pushNamed(context, '/history');
                            },
                          ),
                        );
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      },
                    ),
                    MyResultButton(
                      label: 'BMI Info',
                      onPressed: () {
                        Navigator.pushNamed(context, '/info');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyBigButton(
            label: 'RE-CALCULATE BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
