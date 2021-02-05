import 'package:Sipnayan/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../model/quiz_model.dart';

class HomeQuiz extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<HomeQuiz> {
  var randomArray = [];

  List quizQuestion;
  List<QuizModel> quizRandomQuestion = [];

  @override
  void initState() {
    super.initState();
  }

  void pythonTopic() {
    quizQuestion = getPythonQuestionSet;
    genrandomArray();
    randomArray.forEach(
      (index) {
        print(index);
        print(quizQuestion[0][index.toString()]);

        List<String> choicess = [
          quizQuestion[1][index.toString()]["a"],
          quizQuestion[1][index.toString()]["b"],
          quizQuestion[1][index.toString()]["c"],
          quizQuestion[1][index.toString()]["d"],
        ];

        quizRandomQuestion.add(
          QuizModel(
            question: quizQuestion[0][index.toString()],
            choices: choicess,
            answer: quizQuestion[2][index.toString()],
          ),
        );
      },
    );
  }

  void genrandomArray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(15) + 1);
      randomArray = distinctIds.toSet().toList();
      if (randomArray.length < 11) {
        continue;
      } else {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    pythonTopic();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => QuizScreen(quizRandomQuestion),
                      ),
                    );
                  },
                  child: Text("Take python quiz"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
