import 'package:Sipnayan/screens/result_page.dart';
import 'package:Sipnayan/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizModel> randomQuiz;
  QuizScreen(this.randomQuiz);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int timer = 9999;
  int _score;
  bool cancelTimer = false;

  List<QuizModel> randomizedQuiz;

  bool _checkAnswer(String answer, String value) {
    if (answer == value) {
      _score++;
      Timer(Duration(milliseconds: 1500), nextQuestion);
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    setState(
      () {
        _index++;
        if (_index >= 10) {
          cancelTimer = true;
          return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ResultPage(marks: _score, time: 9999 - timer),
          ));
        } else {}
      },
    );
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(
      onesec,
      (Timer t) {
        if (timer < 1) {
          t.cancel();
          //nextQuestion();
        } else if (cancelTimer) {
          t.cancel();
        } else {
          timer--;
        }
      },
    );
  }

  @override
  void initState() {
    randomizedQuiz = widget.randomQuiz;

    print("=============");
    print("${randomizedQuiz[0].question}");
    print("=============");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    print("QUIZ SCREEN BUILDED");
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Quiz"),
            content: Text("You can't go back at this stage"),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Ok"),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        body: IndexedStack(
          index: _index,
          children: randomizedQuiz
              .map(
                (quiz) => QuestionCard(
                  question: quiz.question,
                  answer: quiz.answer,
                  choices: quiz.choices,
                  checkAnswer: _checkAnswer,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
