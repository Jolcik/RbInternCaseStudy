import 'package:flutter/material.dart';

class SleepRecord {

  final DateTime date;
  final String type;
  final int durationInMinutes;

  SleepRecord({
    @required this.date,
    @required this.type,
    @required this.durationInMinutes
  });

}