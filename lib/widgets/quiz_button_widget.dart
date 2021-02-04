import 'package:flutter/material.dart';

class QuizButton extends StatefulWidget {
  final value;
  final answer;
  final Function checkAnswer;

  QuizButton({
    @required this.value,
    @required this.answer,
    @required this.checkAnswer,
  });

  @override
  _QuizButtonState createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  var isCorrect;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              isCorrect = widget.checkAnswer(widget.answer, widget.value);
            });
          },
          child: Text(
            widget.value,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Alike",
              fontSize: 16,
            ),
          ),
          color: isCorrect == null
              ? Colors.indigoAccent
              : isCorrect
                  ? Colors.green
                  : Colors.red,
          splashColor: Colors.indigo[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
