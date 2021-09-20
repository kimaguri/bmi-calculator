import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

enum Operation {
  weightPlus,
  weightMinus,
  agePlus,
  ageMinus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int sliderHeight = 120;
  int weightNumber = 35;
  int ageNumber = 19;

  void updateColor({Gender gender}) {
    setState(() {
      selectedGender = gender;
    });
  }

  void updateWeight(Operation action) {
    setState(() {
      action == Operation.weightMinus ? weightNumber-- : weightNumber++;
    });
  }

  void updateAge(Operation action) {
    setState(() {
      action == Operation.ageMinus ? ageNumber-- : ageNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {

    CalculatorBrain calc = CalculatorBrain(height: sliderHeight, weight: weightNumber);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kColors['activeCard']
                          : kColors['inactiveCard'],
                      cardChild: IconContent(
                          title: 'MALE', icon: FontAwesomeIcons.mars),
                      onTap: () => updateColor(gender: Gender.male),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kColors['activeCard']
                          : kColors['inactiveCard'],
                      cardChild: IconContent(
                          title: 'FEMALE', icon: FontAwesomeIcons.venus),
                      onTap: () => updateColor(gender: Gender.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kColors['activeCard'],
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sliderHeight.toString(),
                          style: kHeightNumberTextStyle,
                        ),
                        Text(
                          'cm',
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: sliderHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) => setState(() {
                          sliderHeight = newValue.round();
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kColors['activeCard'],
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weightNumber.toString(),
                            style: kHeightNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () =>
                                    updateWeight(Operation.weightMinus),
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () =>
                                    updateWeight(Operation.weightPlus),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kColors['activeCard'],
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            ageNumber.toString(),
                            style: kHeightNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => updateAge(Operation.ageMinus),
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => updateAge(Operation.agePlus),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: calc.getResult(),
                      bmi: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                color: kColors['bottomContainerColor'],
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CALCULATE',
                      style: kMainButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
