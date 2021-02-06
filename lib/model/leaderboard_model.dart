import 'package:flutter/foundation.dart';

class LeaderBoardModel {
  final id;
  final name;
  final score;
  final time;

  LeaderBoardModel({
    @required this.id,
    @required this.name,
    @required this.score,
    @required this.time,
  });
}
