import 'package:Sipnayan/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../model/quiz_model.dart';

class HomeQuiz extends StatefulWidget {
  static const routeName = "/home-quiz";
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<HomeQuiz> {
  var randomArray = [];
  String name;

  List quizQuestion;
  List<QuizModel> quizRandomQuestion = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('name')) {
        name = prefs.getString('name');
      }
    });
    super.initState();
  }

  void fractionTopic() {
    quizQuestion = getFractionQuestionSet;
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

  void arithmeticTopic() {
    quizQuestion = getArithmeticQuestionSet;
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

  void problemsolvingTopic() {
    quizQuestion = getProblemSolvingQuestionSet;
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
      distinctIds.add(rand.nextInt(20) + 1);
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgwosipnayan.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Quiz"),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonBuilder("topic1", "Fractions"),
                  buttonBuilder("topic2", "Arithmetic"),
                  buttonBuilder("topic3", "Problem Solving"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonBuilder(String where, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          onPressed: () {
            if (where == "topic1") {
              //Fractions
              fractionTopic();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => QuizScreen(quizRandomQuestion, name),
                ),
              );
            } else if (where == "topic2") {
              arithmeticTopic();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => QuizScreen(quizRandomQuestion, name),
                ),
              );
            } else if (where == "topic3") {
              problemsolvingTopic();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => QuizScreen(quizRandomQuestion, name),
                ),
              );
            }
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
