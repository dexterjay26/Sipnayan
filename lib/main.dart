import 'package:Sipnayan/screens/home_page.dart';
import 'package:Sipnayan/screens/home_quiz.dart';
import 'package:Sipnayan/screens/learn_home_screen.dart';
import 'package:Sipnayan/screens/learn_screen.dart';
import 'package:Sipnayan/screens/quiz_screen.dart';
import 'package:Sipnayan/screens/settings_screen.dart';
import 'package:Sipnayan/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        HomeQuiz.routeName: (ctx) => HomeQuiz(),
        LearnHomeScreen.routeName: (ctx) => LearnHomeScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
