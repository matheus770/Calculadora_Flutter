import 'package:calc_kb/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 8,
        navigateAfterSeconds: new CalculatorPage(),
        title: new Text('Calculadora \n Matheus.G',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.blue
          ),),
        image: new Image.asset("assets/images/imgg.png"),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () {},
        loaderColor: Colors.blue
    );
  }
}