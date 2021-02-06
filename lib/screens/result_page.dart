import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Sipnayan/screens/home_page.dart';
import '../model/leaderboard_model.dart';
import '../helpers/db_helper.dart';

class ResultPage extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: FutureBuilder(
        future: fetchAndGetLeaderBoards(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Material(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              child: ClipRect(
                                child: Image(
                                  image: AssetImage(image),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Center(
                                child: Text(
                                  message,
                                  textAlign: TextAlign.justify,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlineButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => HomePage(),
                              ),
                            );
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(fontSize: 18),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          borderSide:
                              BorderSide(width: 2, color: Colors.indigoAccent),
                        ),
                        OutlineButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Quiz"),
                                content: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: leaderboards.length,
                                    itemBuilder: (ctx, i) {
                                      return LimitedBox(
                                        maxHeight: 100,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(leaderboards[i].name),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(leaderboards[i].score),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(timeRecords[i]),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                actions: [
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("Ok"),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Leaderboard",
                            style: TextStyle(fontSize: 18),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          borderSide:
                              BorderSide(width: 2, color: Colors.indigoAccent),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
