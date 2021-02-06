import 'package:Sipnayan/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var isSetName = false;
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('isNameSet')) {
        isSetName = prefs.getBool('isNameSet');
      } else {
        print("=================");
        print("WALA");
        print("=================");
      }
    });
    Timer(
      Duration(seconds: 1),
      () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(isSetName),
          ),
        )
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the splash screen"),
      ),
    );
  }
}
