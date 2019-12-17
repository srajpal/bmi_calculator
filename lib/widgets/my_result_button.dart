import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/constants.dart';

class MyResultButton extends StatelessWidget {
  const MyResultButton({@required this.label, @required this.onPressed});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        label,
        style: TEXT_RESULT_BUTTON,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      fillColor: const Color(0xFF181A2E),
      elevation: 3.0,
      constraints: const BoxConstraints.tightFor(
        width: 150,
        height: 70,
      ),
    );
  }
}
