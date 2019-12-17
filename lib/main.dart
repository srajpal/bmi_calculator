import 'dart:math';

import 'package:bmi_calculator/screens/about_page.dart';
import 'package:bmi_calculator/screens/history_page.dart';
import 'package:bmi_calculator/screens/info_page.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/database.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

Future<void> createTestData() async {
  //print('testDB()');
  final BMIModel _bmi = BMIModel(
    date: DateTime(
      2019,
      Random().nextInt(12) + 1,
      Random().nextInt(28) + 1,
    ),
    bmi: (Random().nextInt(30) + 15).toDouble(),
  );
  await BMIDatabase.db.insert(_bmi);
  final List<dynamic> data = await BMIDatabase.db.getAll();
  print(data);
  //await await BMIDatabase.db.deleteAll();
}

Future<void> dumpDB() async {
  await BMIDatabase.db.getAll();
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //createTestData();
    //dumpDB();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        snackBarTheme: SnackBarThemeData(
          backgroundColor: COLOR_PRIMARY,
          actionTextColor: COLOR_TEXT,
          contentTextStyle: TEXT_LABEL,
        ),
        primaryColor: COLOR_PRIMARY,
        scaffoldBackgroundColor: COLOR_PRIMARY,
        textTheme: const TextTheme(
          body1: TextStyle(
            color: COLOR_TEXT,
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => InputPage(),
        '/info': (BuildContext context) => InfoPage(),
        '/about': (BuildContext context) => AboutPage(),
        '/history': (BuildContext context) => HistoryPage(),
      },
      initialRoute: '/',
    );
  }
}
