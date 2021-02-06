import 'package:Sipnayan/screens/home_quiz.dart';
import 'package:Sipnayan/screens/learn_home_screen.dart';
import 'package:Sipnayan/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  final bool isSetName;

  HomePage([this.isSetName]);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.isSetName != null ? !widget.isSetName : false) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Set Name"),
              content: LimitedBox(
                maxHeight: 100,
                child: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      Future.delayed(Duration.zero, () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isNameSet', true);
                        await prefs.setString('name', nameController.text);
                      });
                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showToast(
                        msg: "Add name first",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Sipnayan",
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                homeButtonBuilder("LEARN", () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => LearnHomeScreen()));
                }),
                homeButtonBuilder("START QUIZ", () {
                  print("start quiz");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => HomeQuiz()));
                }),
                homeButtonBuilder("SETTINGS", () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => SettingsScreen()));
                }),
                homeButtonBuilder("EXIT", () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => HomePage()));
                }),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeButtonBuilder(String btnText, Function function) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: OutlineButton(
          onPressed: function,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
