import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('name')) {
        nameController.text = prefs.getString('name');
      }
    });
    super.initState();
  }

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Spacer(),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: AspectRatio(
                    aspectRatio: 13/5,
                                      child: RaisedButton(
                onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('name', nameController.text);
                },
                child: Text("Save name"),
              ),
                  )),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
