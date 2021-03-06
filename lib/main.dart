import 'package:flutter/material.dart';

import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.dark();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(surface: Color(0xFF0A0E21)),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
