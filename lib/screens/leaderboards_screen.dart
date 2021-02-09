import 'package:Sipnayan/screens/leaderboards_single_screen2.dart';
import 'package:flutter/material.dart';

class LeaderBoardsScreen extends StatefulWidget {
  static const routeName = "/leaderboard";
  final type;
  LeaderBoardsScreen([this.type]);

  @override
  _LeaderBoardsScreenState createState() => _LeaderBoardsScreenState();
}

class _LeaderBoardsScreenState extends State<LeaderBoardsScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _tabs = [
      LeaderBoardsSingleScreen2("Fractions"),
      LeaderBoardsSingleScreen2("Arithmetic"),
      LeaderBoardsSingleScreen2("Problem Solving"),
    ];
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgwosipnayan.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Leaderboards"),
            backgroundColor: Colors.transparent,
          ),
          body: _tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: Text("Fraction", textAlign: TextAlign.center),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Text("Arithmetic", textAlign: TextAlign.center),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Text("Problem Solving", textAlign: TextAlign.center),
                label: '',
              ),
            ],
            onTap: (indexx) {
              setState(() {
                _currentIndex = indexx;
              });
            },
          ),
        ),
      ),
    );
  }

  String timeToShoww(int time) {
    int minutess = (time / 60).truncate();
    int secondss = time % 60;

    if (minutess == 0) {
      return "${time}s";
    } else {
      return "${minutess}m and ${secondss}s";
    }
  }

  Widget headerBuilder(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget textBuilder(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
