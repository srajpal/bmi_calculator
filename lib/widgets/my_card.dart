import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/constants.dart';

class MyCard extends StatelessWidget {
  const MyCard({this.active = false, this.child, this.onPress});

  final bool active;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onPress != null) {
            onPress();
          }
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: active ? COLOR_ACTIVE : COLOR_INACTIVE,
          ),
          child: child,
        ),
      ),
    );
  }
}
