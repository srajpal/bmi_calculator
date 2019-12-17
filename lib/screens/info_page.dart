import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bmi_calculator/shared/constants.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'BMI Info',
              style: TEXT_LARGE,
            ),
          ),
          MyCard(
            active: true,
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                const Text(
                  WHAT_IS_BMI,
                  style: TEXT_LABEL,
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/bmi_graph.png',
                  width: double.infinity,
                ),
                const Text(
                  'BMI Categories',
                  style: TEXT_LABEL,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    HOW_IS_BMI_USED,
                    style: TEXT_LABEL,
                    textAlign: TextAlign.left,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    AM_I_AT_RISK,
                    style: TEXT_LABEL,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Learn more at:\n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text:
                              'https://www.cdc.gov/healthyweight/assessing/bmi/index.html\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.cdc.gov/healthyweight/assessing/bmi/index.html');
                            },
                        ),
                        TextSpan(
                          text: 'https://www.webmd.com/men/weight-loss-bmi\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.webmd.com/men/weight-loss-bmi');
                            },
                        ),
                        TextSpan(
                          text:
                              'https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/index.htm\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/index.htm');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
