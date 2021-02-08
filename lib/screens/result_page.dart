import 'dart:async';

import 'package:Sipnayan/screens/leaderboards_screen.dart';
import 'package:flutter/material.dart';
import 'package:Sipnayan/screens/home_page.dart';
import '../model/leaderboard_model.dart';
import '../helpers/db_helper.dart';

class ResultPage extends StatefulWidget {
  static const routeName = "/result-page";
  final marks;
  final time;
  ResultPage({this.marks, this.time});

  @override
  _ResultPageState createState() => _ResultPageState(marks, time);
}

class _ResultPageState extends State<ResultPage> {
  final marks;
  final time;

  _ResultPageState(this.marks, this.time);

  List<LeaderBoardModel> leaderboards;
  List<String> timeRecords = [];

  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;
  String showTime;

  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      int minutes = (time / 60).truncate();
      int seconds = (time % 60);

      if (minutes == 0) {
        showTime = "${time}s";
      } else {
        showTime = "${minutes}m and ${seconds}s";
      }

      if (marks <= 3) {
        image = images[2];
        message =
            "You need to try it more\nScore $marks marks\nTime: $showTime";
      } else if (marks > 3 && marks <= 9) {
        image = images[1];
        message = "Good Job\nScore $marks marks\nTime: $showTime";
      } else {
        image = images[0];
        message = "Perfect!!!\nScore $marks marks\nTime: $showTime";
      }

      fetchAndGetLeaderBoards();

      _isInit = false;
    }
    super.didChangeDependencies();
  }

  Future<void> fetchAndGetLeaderBoards() async {
    var dataList = await DBHelper.getData('leaderboard');

    if (dataList != null) {
      leaderboards = dataList.map(
        (score) {
          return LeaderBoardModel(
            id: score['id'],
            name: score['name'],
            score: score['score'],
            time: score['time'],
          );
        },
      ).toList();

      leaderboards.forEach((element) {
        int minutess = (int.parse(element.time) / 60).truncate();
        int secondss = (int.parse(element.time) % 60);

        if (minutess == 0) {
          timeRecords.add("${element.time}s");
        } else {
          timeRecords.add("${minutess}m and ${secondss}s");
        }
      });

      leaderboards
          .sort((a, b) => int.parse(b.score).compareTo(int.parse(a.score)));
    } else {
      print("NO DATA");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Result",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: FutureBuilder(
            future: fetchAndGetLeaderBoards(),
            builder: (ctx, snapShot) =>
                snapShot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Opacity(
                              opacity: 0.9,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white, // added
                                  border: Border.all(
                                      color: Colors.white, width: 0), // added
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                      child: Center(
                                        child: Text(
                                          message,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Quando",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonBuilder(() {
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomePage.routeName);
                                }, "assets/images/continues.png"),
                                buttonBuilder(() {
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomePage.routeName);
                                }, "assets/images/leaderboard.png"),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  Widget buttonBuilder(Function function, String image) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 10 / 2.4,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: function,
    );
  }
}
