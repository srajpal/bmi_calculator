import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:bmi_calculator/widgets/my_hr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const double PADDING = 10.0;

class AboutPage extends StatelessWidget {
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
              'App Info',
              style: TEXT_LARGE,
            ),
          ),
          MyCard(
            active: true,
            child: ListView(
              padding: const EdgeInsets.all(PADDING),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/app_icon.png',
                  ),
                ),
                MyHR(),
                Padding(
                  padding: const EdgeInsets.all(PADDING),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text:
                              'Development/Programming by: \n\nSunny Rajpal\n\n',
                          style: TEXT_LABEL,
                        ),
                        const TextSpan(
                          text: 'Rajpal Consulting Services, Inc.\n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text: 'https://www.srajpal.com\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.srajpal.com');
                            },
                        ),
                        const TextSpan(
                          text:
                              'For comments and suggestions, send an email to:\n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text: 'info@srajpal.com\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('mailto:info@srajpal.com');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                MyHR(),
                Padding(
                  padding: const EdgeInsets.all(PADDING),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Design inspired by: \n\nRuben Vaalt\n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text: 'https://dribbble.com/rvaalt\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://dribbble.com/rvaalt');
                            },
                        ),
                        TextSpan(
                          text:
                              'https://dribbble.com/shots/4585382-Simple-BMI-Calculator\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://dribbble.com/shots/4585382-Simple-BMI-Calculator');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                MyHR(),
                Padding(
                  padding: const EdgeInsets.all(PADDING),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Special thanks to: \n\nAngela Yu\n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text:
                              'https://www.udemy.com/user/4b4368a3-b5c8-4529-aa65-2056ec31f37e/\n\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.udemy.com/user/4b4368a3-b5c8-4529-aa65-2056ec31f37e/');
                            },
                        ),
                        TextSpan(
                          text: 'https://www.appbrewery.co/\n',
                          style: TEXT_LINK,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.appbrewery.co/');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(PADDING),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Disclaimer: \n\n',
                          style: TEXT_LABEL,
                        ),
                        TextSpan(
                          text:
                              'This app provides information for educational purpose only. The information provided is not medical or treatment advice and may not be treated as such by the user. As such, this App may not be relied upon for the purposes of medical diagnosis or as a recommendation for medical care or treatment. The information on this App is not a substitute for professional medical advice, diagnosis or treatment. All content, including text, graphics, images and information, contained on or available through this App is for general information purposes only.',
                          style: TEXT_LABEL,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(),
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
