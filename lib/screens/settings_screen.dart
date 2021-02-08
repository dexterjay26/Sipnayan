import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings";
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        final prefs = await SharedPreferences.getInstance();

        if (prefs.containsKey('name')) {
          nameController.text = prefs.getString('name');
        }
      },
    );
    super.initState();
  }

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            title: Text("Settings"),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: nameController,
                            decoration: new InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0),
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10),
                          AspectRatio(
                            aspectRatio: 3 / .55,
                            child: FlatButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString(
                                  'name',
                                  nameController.text,
                                );

                                Fluttertoast.showToast(
                                  msg: "Name Saved!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                );
                              },
                              child: Text(
                                "Save name",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textBuilder("Researchers", true),
                          textBuilder("Wagan, Averiene May A."),
                          textBuilder("Dela Cruz, Hannah Jane G."),
                          textBuilder("Morales, Mary Rose R."),
                          textBuilder("Sarmiento, John Zeus D."),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textBuilder(String text, [bool isHeader]) {
    return Container(
      margin: isHeader == null
          ? EdgeInsets.symmetric(vertical: 7)
          : EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: isHeader == null ? 20 : 30,
        ),
      ),
    );
  }
}
