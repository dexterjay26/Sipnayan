import 'package:flutter/material.dart';
import '../model/leaderboard_model.dart';
import '../helpers/db_helper.dart';

class LeaderBoardsSingleScreen extends StatefulWidget {
  static const routeName = "/leaderboard";
  final type;
  LeaderBoardsSingleScreen(this.type);

  @override
  _LeaderBoardsSingleScreenState createState() =>
      _LeaderBoardsSingleScreenState();
}

class _LeaderBoardsSingleScreenState extends State<LeaderBoardsSingleScreen> {
  List<LeaderBoardModel> leaderboards;

  Future<void> fetchAndGetLeaderBoards() async {
    var dataList = await DBHelper.getData('leaderboard');

    if (dataList != null) {
      leaderboards = dataList
          .map(
            (score) {
              return LeaderBoardModel(
                id: score['id'],
                name: score['name'],
                score: score['score'],
                time: score['time'],
                type: score['type'],
              );
            },
          )
          .toList()
          .where((element) => element.type == widget.type)
          .toList();

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
        color: Colors.black38,
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
          body: FutureBuilder(
            future: fetchAndGetLeaderBoards(),
            builder: (ctx, snapShot) => snapShot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.type,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Table(
                          children: [
                            TableRow(children: [
                              headerBuilder("Name"),
                              headerBuilder("Score"),
                              headerBuilder("Time")
                            ]),
                            ...leaderboards.map(
                              (e) {
                                String timetoShow =
                                    timeToShoww(int.parse(e.time));
                                return TableRow(
                                  children: [
                                    textBuilder(e.name),
                                    textBuilder(e.score),
                                    textBuilder(timetoShow),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  String timeToShoww(int timee) {
    int minutess = (timee / 60).truncate();
    int secondss = timee % 60;

    if (minutess == 0) {
      return "${timee}s";
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
