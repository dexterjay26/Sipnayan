import 'dart:math';

class QuizModel {
  final question;
  final answer;
  final List<String> choices;

  QuizModel({
    this.question,
    this.answer,
    this.choices,
  });
}



List get getPythonQuestionSet{
  return _pythonQuestionSet;
}

//data
const List _pythonQuestionSet = [
  {
    "1": "U rich?",
    "2": "U lazy?",
    "3": "U ugly?",
    "4": "U small?",
    "5": "U handsome?",
    "6": "U cute?",
    "7": "U good?",
    "8": "U happy?",
    "9": "U cutiepie?",
    "10": "U pretty?",
    "11": "1 + 1?",
    "12": "1 + 2?",
    "13": "1 + 3?",
    "14": "1 + 4?",
    "15": "1 + 5?",
  },
  {
    "1": {
      "a": "no",
      "b": "yesss",
      "c": "yess",
      "d": "yes",
    },
    "2": {
      "a": "no",
      "b": "yesss",
      "c": "yess",
      "d": "yes",
    },
    "3": {
      "a": "no",
      "b": "yesss",
      "c": "yess",
      "d": "yes",
    },
    "4": {
      "a": "no",
      "b": "yesss",
      "c": "yess",
      "d": "yes",
    },
    "5": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "6": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "7": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "8": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "9": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "10": {
      "a": "no",
      "b": "noo",
      "c": "nooo",
      "d": "yes",
    },
    "11": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "4",
    },
    "12": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "4",
    },
    "13": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "4",
    },
    "14": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "4",
    },
    "15": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "4",
    },
  },
  {
    "1": "no",
    "2": "no",
    "3": "no",
    "4": "no",
    "5": "yes",
    "6": "yes",
    "7": "yes",
    "8": "yes",
    "9": "yes",
    "10": "yes",
    "11": "2",
    "12": "3",
    "13": "4",
    "14": "5",
    "15": "6",
  }
];
