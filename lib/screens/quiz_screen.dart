import 'package:Sipnayan/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helpers/db_helper.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';
import 'dart:async';

import '../model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/quiz-screen";
  final List<QuizModel> randomQuiz;
  final name;
  QuizScreen(this.randomQuiz, this.name);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int timer = 9999;
  int _score = 0;
  bool cancelTimer = false;

  Color colortoShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  AudioCache audioCache = AudioCache();

  bool btnClickable = true;

  List<QuizModel> randomizedQuiz;

  List tList = List.generate(10, (i) => List(4), growable: false);

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
    randButton();
    startTimer();
    super.initState();
  }

  void randButton() {
    for (int w = 0; w < 10; w++) {
      tList[w] = genRandomButton();
      print(tList[w]);
    }
  }

  var randombuttons = [];
  List genRandomButton() {
    var uniqueList = [];
    var rng = new Random();
    while (true) {
      for (var i = 0; i < 4; i++) {
        uniqueList.add(rng.nextInt(4));
      }
      randombuttons = uniqueList.toSet().toList();
      if (randombuttons.length < 4) {
        continue;
      } else {
        break;
      }
    }
    return randombuttons;
  }

  void checkAnswer({String key, String value}) async {
    if (randomizedQuiz[_index].answer == value) {
      _score++;
      audioCache.play('audio/correct.mp3');
      colortoShow = Colors.green;
    } else {
      audioCache.play('audio/wrong.mp3');
      colortoShow = Colors.red;
    }

    setState(() {
      btncolor[key] = colortoShow;

      btnClickable = false;

      Timer(Duration(milliseconds: 1100), nextQuestion);
    });
  }

  void nextQuestion() {
    setState(
      () {
        _index++;
        if (_index >= 10) {
          cancelTimer = true;

          Timer(Duration.zero, () async {
            await DBHelper.insert('leaderboard', {
              'id': widget.name + DateTime.now().toString(),
              'name': widget.name,
              'score': _score.toString(),
              'time': (9999 - timer).toString(),
            });
          });
          return Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  ResultPage(marks: _score, time: 9999 - timer),
            ),
          );
        }
        btncolor["a"] = Colors.indigoAccent;
        btncolor["b"] = Colors.indigoAccent;
        btncolor["c"] = Colors.indigoAccent;
        btncolor["d"] = Colors.indigoAccent;

        btnClickable = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
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
                (quiz) => questionBuilder(
                  question: quiz.question,
                  choices: quiz.choices,
                  answer: quiz.answer,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget questionBuilder({String question, List choices, String answer}) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "${_index + 1}. $question",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Quando",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonBuilder(key: "a", value: choices[tList[_index][0]]),
                buttonBuilder(key: "b", value: choices[tList[_index][1]]),
                buttonBuilder(key: "c", value: choices[tList[_index][2]]),
                buttonBuilder(key: "d", value: choices[tList[_index][3]]),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buttonBuilder({String key, String value}) => AspectRatio(
        aspectRatio: 11 / 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: AnimatedContainer(
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 500),
            color: btncolor[key],
            child: OutlineButton(
              onPressed: btnClickable
                  ? () => checkAnswer(key: key, value: value)
                  : null,
              child: Text(
                "$key. $value",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Alike",
                  fontSize: 16,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      );
}
