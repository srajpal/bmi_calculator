import 'package:bmi_calculator/shared/calculator.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/widgets/my_big_button.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:bmi_calculator/widgets/my_chooser.dart';
import 'package:bmi_calculator/widgets/my_drawer.dart';
import 'package:bmi_calculator/widgets/my_slider.dart';
import 'package:bmi_calculator/widgets/my_unit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //bool genderMaleActive = false;
  //bool genderFemaleActive = false;
  bool metric = true;
  int height = 180;
  int weight = 74;

  // need the global key in order to access the scaffold instance
  // so we can open the drawer attached to it from our custom icon
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //print('InputPage::initState()');
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    //print('InputPage::_loadPrefs()');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      metric = prefs.getBool('metric') ?? true;
      height = prefs.getInt('height') ?? 180;
      weight = prefs.getInt('weight') ?? 74;
    });
  }

  Future<void> _savePrefs() async {
    //print('InputPage::_savePrefs()');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('metric', metric);
    prefs.setInt('height', height);
    prefs.setInt('weight', weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // scaffold key to access instance
      appBar: AppBar(
        title: const Text(APP_TITLE),
        leading: GestureDetector(
          // add our own icon, so we can make it larger
          child: Icon(
            Icons.menu,
            size: 40.0,
          ),
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: Column(
        // this line fixes the issue where MyCard which does not have a Expanded
        // and Column/Row will fit the Container that is the child to the width
        // of the child of the Container
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                MyCard(
                  child: const MyUnit(metric: true),
                  active: metric,
                  onPress: () {
                    setState(() {
                      metric = !metric;
                    });
                  },
                ),
                MyCard(
                  child: const MyUnit(metric: false),
                  active: !metric,
                  onPress: () {
                    setState(() {
                      metric = !metric;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                MyCard(
                  active: true,
                  child: MySlider(
                    height: height,
                    metric: metric,
                    slider: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                MyCard(
                  active: true,
                  child: MyChooser(
                    title: 'WEIGHT',
                    unit: metric ? 'kg' : 'lbs',
                    value: metric ? weight : (weight * 2.2).floor(),
                    onPressMinus: () {
                      setState(() {
                        if (weight > 1) {
                          weight--;
                        }
                      });
                    },
                    onPressPlus: () {
                      setState(() {
                        if (weight < 999) {
                          weight++;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          MyBigButton(
            label: 'CALCULATE BMI',
            onTap: () {
              _savePrefs();

              final Calculator calc = Calculator(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ResultsPage(
                    bmi: calc.calculateBMI(),
                    result: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
