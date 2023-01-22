import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Model/SupportModel/Event.dart';
import 'package:vet_pass/Model/VisitModel.dart';

import '../../Variables/GlobalVariables.dart';


@immutable
class CalendarPageState{

  final List<VisitModel> visit;
  final Event currentVisit;
  final LinkedHashMap<DateTime?, List<Event>>?  markedDateMap;
  final List<Event> selectedEvents;
  final int isLoadingCalendarPage;

  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime? focusedDay;
  final DateTime? selectedDay;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;

  const CalendarPageState(
    {
      required this.visit,
      required this.isLoadingCalendarPage,
      required this.currentVisit,
      this.markedDateMap,
      required this.calendarFormat,
      this.focusedDay,
      required this.rangeSelectionMode,
      this.rangeEnd,
      this.rangeStart,
      this.selectedDay,
      required this.selectedEvents,
    }
  );

  const CalendarPageState.initialState()
    : visit = const <VisitModel>[],
      currentVisit = const Event.initialState(),
      isLoadingCalendarPage = 0,
      markedDateMap =  null,
      calendarFormat = CalendarFormat.month,
      focusedDay = null,
      rangeSelectionMode = RangeSelectionMode.toggledOff,
      rangeEnd = null,
      rangeStart = null,
      selectedDay = null,
      selectedEvents = const <Event>[];
}