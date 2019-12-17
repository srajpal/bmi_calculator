import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/shared/constants.dart';

class MyUnit extends StatelessWidget {
  const MyUnit({@required this.metric});

  final bool metric;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          metric ? FontAwesomeIcons.globeEurope : FontAwesomeIcons.flagUsa,
          size: ICON_SIZE,
        ),
        const SizedBox(
          height: SEPARATOR_HEIGHT,
        ),
        Text(
          metric ? 'Metric' : 'Imperial',
          style: TEXT_LABEL,
        )
      ],
    );
  }
}
