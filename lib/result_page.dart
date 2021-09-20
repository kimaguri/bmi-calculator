import 'package:flutter/material.dart';

import 'reusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.result, this.bmi, this.interpretation});

  final String result;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              colour: kColors['activeCard'],
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 75.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0,),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: kColors['bottomContainerColor'],
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RE-CALCULATE',
                    style: kMainButtonTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
