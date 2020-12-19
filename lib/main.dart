import 'package:flutter/material.dart';
import 'package:CocktailsApp/hompage.dart';

const Color myColor=Colors.brown;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CocktApp',
      theme: ThemeData(
        primarySwatch: myColor,
    

      ),
      home: MyHomePage(),
    );
  }
}

