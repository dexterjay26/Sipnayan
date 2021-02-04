import 'package:Sipnayan/screens/home_quiz.dart';
import 'package:Sipnayan/screens/learn_home_screen.dart';
import 'package:Sipnayan/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goTo(String goto) {
      if (goto == "learn") {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeQuiz()));
      } else if (goto == "play") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => LearnHomeScreen()));
      } else if (goto == "settings") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => SettingsScreen()));
      } else if (goto == "exit") {
        //Exit the App
      }
    }

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
                  goTo("learn");
                }),
                homeButtonBuilder("START QUIZ", () {
                  goTo("play");
                }),
                homeButtonBuilder("SETTINGS", () {
                  goTo("settings");
                }),
                homeButtonBuilder("EXIT", () {
                  goTo("exit");
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
