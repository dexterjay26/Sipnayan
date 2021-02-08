import 'package:Sipnayan/screens/learn_screen.dart';
import 'package:flutter/material.dart';

class LearnHomeScreen extends StatelessWidget {
  static const routeName = "/learn-home-screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgwosipnayan.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Learn Math"),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonBuilder("Arithmetic", "xJBmbfs0R6M", context),
                    buttonBuilder("Fractions", "G-glIljwMUA", context),
                    buttonBuilder("Fractions 2", "pnUhsU0LvXo", context),
                    buttonBuilder("Problem Solving", "niTKRc_BUWI", context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonBuilder(String topic, String videoId, BuildContext context) {
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => LearnScreen(videoId, topic),
              ),
            );
          },
          child: Text(
            topic,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
