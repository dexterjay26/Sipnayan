import 'package:flutter/foundation.dart';

class LeaderBoardModel {
  final id;
  final name;
  final score;
  final time;
  final type;

  LeaderBoardModel({
    @required this.id,
    @required this.name,
    @required this.score,
    @required this.time,
    @required this.type,
  });
}
