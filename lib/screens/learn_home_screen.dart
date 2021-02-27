import 'package:Sipnayan/screens/learn_screen.dart';
import 'package:flutter/material.dart';

class LearnHomeScreen extends StatefulWidget {
  static const routeName = "/learn-home-screen";

  @override
  _LearnHomeScreenState createState() => _LearnHomeScreenState();
}

class _LearnHomeScreenState extends State<LearnHomeScreen> {
  var arithmeticImage;
  var fractionImage1;
  var fractionImage2;
  var problemImage;
  @override
  void initState() {
    // TODO: implement initState
    arithmeticImage = AssetImage('assets/images/ARITHMETIC.png');
    fractionImage1 = AssetImage('assets/images/FRACTIONS 1.png');
    fractionImage2 = AssetImage('assets/images/FRACTIONS 2.png');
    problemImage = AssetImage('assets/images/PROBLEM SOLVING.png');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(arithmeticImage, context);
    precacheImage(fractionImage1, context);
    precacheImage(fractionImage2, context);
    precacheImage(problemImage, context);

    super.didChangeDependencies();
  }

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
                    buttonBuilder2('assets/images/ARITHMETIC.png', "Arithmetic",
                        "xJBmbfs0R6M", arithmeticImage, context),
                    buttonBuilder2('assets/images/FRACTIONS 1.png', "Fractions",
                        "G-glIljwMUA", fractionImage1, context),
                    buttonBuilder2('assets/images/FRACTIONS 2.png',
                        "Fractions 2", "pnUhsU0LvXo", fractionImage2, context),
                    buttonBuilder2(
                        'assets/images/PROBLEM SOLVING.png',
                        "Problem Solving",
                        "niTKRc_BUWI",
                        problemImage,
                        context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonBuilder2(
    String image,
    String topic,
    String videoId,
    AssetImage assetImage,
    BuildContext context,
  ) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: assetImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => LearnScreen(videoId, topic),
          ),
        );
      },
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
