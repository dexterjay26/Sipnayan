import 'package:Sipnayan/screens/home_quiz.dart';
import 'package:Sipnayan/screens/learn_home_screen.dart';
import 'package:Sipnayan/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
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
            barrierDismissible: false,
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
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  homeButtonBuilder2("LEARN", () {
                    Navigator.of(context).pushNamed(LearnHomeScreen.routeName);
                  }, "assets/images/learn.png"),
                  homeButtonBuilder2("START QUIZ", () {
                    print("start quiz");
                    Navigator.of(context).pushNamed(HomeQuiz.routeName);
                  }, "assets/images/startquiz.png"),
                  homeButtonBuilder2("SETTINGS", () {
                    Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  }, "assets/images/settings.png"),
                  homeButtonBuilder2("EXIT", () {
                    SystemNavigator.pop();
                  }, "assets/images/exit.png"),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget homeButtonBuilder2(String btnText, Function function, String image) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: Container(
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

  Widget homeButtonBuilder(String btnText, Function function) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: AspectRatio(
        aspectRatio: 11 / 2,
        child: OutlineButton(
          color: Colors.white,
          onPressed: function,
          borderSide: BorderSide(width: 1, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
