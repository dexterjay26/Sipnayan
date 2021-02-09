import 'package:Sipnayan/screens/leaderboards_single_screen.dart';
import 'package:flutter/material.dart';
import 'package:Sipnayan/screens/home_page.dart';
class ResultPage extends StatefulWidget {
  static const routeName = "/result-page";
  final marks;
  final time;
  final type;
  ResultPage({this.marks, this.time, this.type});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String message;

  String timeToShoww(int time) {
    int minutess = (time / 60).truncate();
    int secondss = time % 60;

    if (minutess == 0) {
      return "${time}s";
    } else {
      return "${minutess}m and ${secondss}s";
    }
  }

  @override
  void initState() {
    if (widget.marks == 10) {
      message = "Perfect!";
    } else if (widget.marks >= 6 && widget.marks <= 9) {
      message = "Great Job!";
    } else if (widget.marks <= 5 && widget.marks >= 1) {
      message = "You can do better!";
    } else if (widget.marks == 0) {
      message = "Try again.";
    }

    super.initState();
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
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white, // added
                      border:
                          Border.all(color: Colors.white, width: 0), // added
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
                            child: Column(
                              children: [
                                Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  "Score: ${widget.marks} marks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  "Time: ${timeToShoww(widget.time)}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              LeaderBoardsSingleScreen(widget.type),
                        ),
                      );
                    }, "assets/images/leaderboard.png"),
                  ],
                ),
              ),
            ],
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
