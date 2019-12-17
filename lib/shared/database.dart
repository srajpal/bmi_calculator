import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BMIModel {
  const BMIModel({this.date, this.bmi});

  final DateTime date;
  final double bmi;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.toString(),
      'bmi': bmi,
    };
  }

  String formatDate() {
    final int month = date.month;
    final int day = date.day;
    final int year = date.year;
    final int hour = date.hour;
    final int minute = date.minute;

    return '$month/$day/$year $hour:$minute';
  }

  @override
  String toString() {
    return 'date: $date, bmi: $bmi}';
  }
}

class BMIDatabase {
  BMIDatabase._();

  static final BMIDatabase db = BMIDatabase._();
  static Database _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }

    _db = await openDatabase(
      join(
        await getDatabasesPath(),
        'bmi_database.db',
      ),
      onCreate: (Database db, int version) async {
        return await db.execute(
          'CREATE TABLE bmi(date TEXT, bmi REAL)',
        );
      },
      onUpgrade: (Database db, int version, int a) async {
        return await db.execute(
          'DROP TABLE IF EXISTS bmi;CREATE TABLE bmi(date TEXT, bmi REAL)',
        );
      },
      version: 3,
    );

    return _db;
  }

  Future<int> insert(BMIModel bmi) async {
    final Database db = await database;

    final Future<int> result = db.insert(
      'bmi',
      bmi.toMap(),
    );
    return result;
  }

  Future<int> count() async {
    final Database db = await database;

    final List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT COUNT(rowid) FROM bmi',
    );
    final int count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<List<BMIModel>> getAll() async {
    final Database db = await database;

    final List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT date,bmi FROM bmi ORDER BY date ASC',
    );

    return List<BMIModel>.generate(result.length, (int row) {
      return BMIModel(
        bmi: result[row]['bmi'].toDouble(),
        date: DateTime.parse(result[row]['date']),
      );
    });
  }

  Future<void> drop() async {
    final Database db = await database;

    db.rawQuery(
      'DROP TABLE bmi',
    );
  }

  Future<void> deleteAll() async {
    final Database db = await database;

    db.rawQuery(
      'DELETE FROM bmi',
    );
  }
}
