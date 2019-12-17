import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/constants.dart';

class MySlider extends StatelessWidget {
  const MySlider({
    @required this.height,
    @required this.slider,
    @required this.metric,
  });

  final int height;
  final Slider slider;
  final bool metric;

  String calcHeight() {
    if (metric) {
      return height.toString();
    } else {
      int _in = (height / 2.54).floor();
      final int _ft = (_in / 12).floor();
      _in = _in - (_ft * 12);
      return '$_ft, $_in';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'HEIGHT',
          style: TEXT_LABEL,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              calcHeight(),
              style: TEXT_LARGE,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              metric ? 'cm' : 'ft, in',
              style: TEXT_LABEL,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: const Color(0xFF8D8E98),
            thumbColor: const Color(0xFFEB1555),
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 15.0,
            ),
            overlayColor: const Color(0x29EB1555),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 30.0,
            ),
          ),
          child: slider,
        ),
      ],
    );
  }
}
