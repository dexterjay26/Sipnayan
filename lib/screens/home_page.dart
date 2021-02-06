import 'package:Sipnayan/screens/home_quiz.dart';
import 'package:Sipnayan/screens/learn_home_screen.dart';
import 'package:Sipnayan/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Sipnayan",
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                homeButtonBuilder("LEARN", () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => LearnHomeScreen()));
                }),
                homeButtonBuilder("START QUIZ", () {
                  print("start quiz");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => HomeQuiz()));
                }),
                homeButtonBuilder("SETTINGS", () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => SettingsScreen()));
                }),
                homeButtonBuilder("EXIT", () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => HomePage()));
                }),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeButtonBuilder(String btnText, Function function) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: OutlineButton(
          onPressed: function,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
