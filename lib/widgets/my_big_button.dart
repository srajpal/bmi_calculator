import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/constants.dart';

class MyBigButton extends StatelessWidget {
  const MyBigButton({
    @required this.label,
    @required this.onTap,
  });

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: COLOR_BOTTOM_CONTAINER,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: BOTTOM_CONTAINER_HEIGHT,
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Center(
          child: Text(
            label,
            style: TEXT_BUTTON,
          ),
        ),
      ),
    );
  }
}
