import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void myAlert(BuildContext context, String title, String message) {
  // set up the button
  final Widget okButton = FlatButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );

  final AlertDialog androidAlert = AlertDialog(
    title: Text(title),
    content: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(message),
    ),
    actions: <Widget>[
      okButton,
    ],
  );

  final CupertinoAlertDialog iOSAlert = CupertinoAlertDialog(
    title: Text(title),
    content: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(message),
    ),
    actions: <Widget>[
      okButton,
    ],
  );

  // call built in function to show the dialog
  showDialog<dynamic>(
    context: context,
    barrierDismissible: false, // user must touch button to dismiss
    builder: (BuildContext context) {
      return (Platform.isIOS) ? iOSAlert : androidAlert;
    },
  );
}
