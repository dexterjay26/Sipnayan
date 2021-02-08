import 'package:Sipnayan/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isSetName = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('isNameSet')) {
        isSetName = prefs.getBool('isNameSet');
      }
    });                        

    Timer(
      Duration(seconds: 2),
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
        child: Container(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/images/logo1.1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
