import 'package:bmi_calculator/shared/constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: COLOR_PRIMARY,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 120.0),
                    child: DrawerHeader(
                      child: const Text(
                        'BMI Calculator',
                        style: TEXT_BUTTON,
                      ),
                      decoration: BoxDecoration(
                        color: COLOR_PRIMARY,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: const Text(
                      'BMI Info',
                      style: TEXT_LABEL,
                    ),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/info');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timeline),
                    title: const Text(
                      'BMI History',
                      style: TEXT_LABEL,
                    ),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/history');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: const Text(
                      'App Info',
                      style: TEXT_LABEL,
                    ),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/about');
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70.0,
            width: double.infinity,
            child: Container(
              color: COLOR_PRIMARY,
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  left: 20.0,
                ),
                child: Text(
                  'Copyright 2019\nRajpal Consulting Services, Inc.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
