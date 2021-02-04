import 'package:flutter/material.dart';

class HomeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: null,
              child: Text("Take python quiz"),
            )
          ],
        ),
      ),
    );
  }
}
