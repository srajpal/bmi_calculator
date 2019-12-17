import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});
  Calculator.bmi(double bmi)
      : _bmi = bmi,
        height = 0,
        weight = 0;

  final int height;
  final int weight;
  double _bmi;

  double calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi < 12) {
      return 'invalid height and weight';
    } else if (_bmi >= 12 && _bmi < 15) {
      return 'very severely underweight';
    } else if (_bmi >= 15 && _bmi < 16) {
      return 'severely underweight';
    } else if (_bmi >= 16 && _bmi < 18.5) {
      return 'underweight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'normal';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    } else if (_bmi >= 30 && _bmi < 35) {
      return 'moderately obese';
    } else if (_bmi >= 35 && _bmi < 40) {
      return 'severely obese';
    } else if (_bmi >= 40 && _bmi < 45) {
      return 'very severely obese';
    } else if (_bmi >= 45 && _bmi < 50) {
      return 'morbidly obese';
    } else if (_bmi >= 50 && _bmi < 60) {
      return 'super obese';
    } else {
      return 'hyper obese';
    }
  }
}
