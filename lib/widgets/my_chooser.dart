import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/widgets/my_chooser_button.dart';

class MyChooser extends StatelessWidget {
  const MyChooser({
    @required this.title,
    this.unit,
    @required this.value,
    @required this.onPressMinus,
    @required this.onPressPlus,
  });

  final String title;
  final String unit;
  final int value;
  final Function onPressMinus;
  final Function onPressPlus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          title,
          style: TEXT_LABEL,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyChooserButton(
              icon: Icon(
                Icons.remove,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: onPressMinus,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  value.toString(),
                  style: TEXT_LARGE,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  unit ?? '',
                  style: TEXT_LABEL,
                ),
              ],
            ),
            MyChooserButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: onPressPlus,
            ),
          ],
        ),
      ],
    );
  }
}
