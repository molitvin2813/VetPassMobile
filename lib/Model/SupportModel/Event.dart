import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Event{
  final String diagnosis;
  final String doctorName;
  final String time;
  final int idvisitTable;
  final DateTime? visitTime;
  const Event.initialState()
      : diagnosis = "",
        doctorName = "",
        time = "00:00",
        idvisitTable = -1,
        visitTime = null;

  const Event({ required this.diagnosis, required this.doctorName, required this.time, required this.idvisitTable, required this.visitTime});
}