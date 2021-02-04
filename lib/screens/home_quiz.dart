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

  List pythonQuestions;
  List<QuizModel> pythonRandomQuestions = [];

  @override
  void initState() {
    pythonQuestions = getPythonQuestionSet;

    genrandomArray();
    print(randomArray);
    randomArray.forEach(
      (index) {
        print(index);
        print(pythonQuestions[0][index.toString()]);

        List<String> choicess = [
          pythonQuestions[1][index.toString()]["a"],
          pythonQuestions[1][index.toString()]["b"],
          pythonQuestions[1][index.toString()]["c"],
          pythonQuestions[1][index.toString()]["d"],
        ];

        pythonRandomQuestions.add(
          QuizModel(
            question: pythonQuestions[0][index.toString()],
            choices: choicess,
            answer: pythonQuestions[2][index.toString()],
          ),
        );
      },
    );

    super.initState();
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => QuizScreen(pythonRandomQuestions),
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
