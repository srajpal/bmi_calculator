import 'dart:async';

import 'package:flutter/material.dart';

class MyChooserButton extends StatefulWidget {
  const MyChooserButton({@required this.icon, @required this.onPressed});

  final Icon icon;
  final Function onPressed;

  @override
  _MyChooserButtonState createState() => _MyChooserButtonState();
}

class _MyChooserButtonState extends State<MyChooserButton> {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) {
        setState(() {
          _timer =
              Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
            widget.onPressed();
          });
        });
      },
      onLongPressEnd: (LongPressEndDetails details) {
        setState(() {
          _timer.cancel();
        });
      },
      child: RawMaterialButton(
        child: widget.icon,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        onPressed: widget.onPressed,
        fillColor: const Color(0xFF4C4F5E),
        elevation: 6.0,
        constraints: const BoxConstraints.tightFor(
          width: 53.0,
          height: 53.0,
        ),
      ),
    );
  }
}
