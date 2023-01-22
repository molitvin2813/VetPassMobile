
import 'dart:collection';

import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Model/VisitModel.dart';
import 'package:vet_pass/Redux/CalendarPage/CalendarPageAction.dart';
import 'package:vet_pass/Model/SupportModel/Event.dart';


Reducer<List<VisitModel>>  visitCalendarPageReducer = combineReducers([
  TypedReducer<List<VisitModel>, GetVisitAction>(_getAnimal),
]);

List<VisitModel> _getAnimal(List<VisitModel> value, GetVisitAction action) => action.visit;

Reducer<int> isLoadingCalendarPage = combineReducers([
  TypedReducer<int, IsLoad>(_isLoad),
  TypedReducer<int, IsLoaded>(_isLoaded),
]);

int _isLoad(int value, IsLoad action) => 0;
int _isLoaded(int value, IsLoaded action) => 1;

Reducer<LinkedHashMap<DateTime?, List<Event>>?> markedDateMapReducer = combineReducers([
  TypedReducer<LinkedHashMap<DateTime?, List<Event>>?, GetMarkedDateMap>(_getMarkedDateMap),
]);

LinkedHashMap<DateTime?, List<Event>>? _getMarkedDateMap(LinkedHashMap<DateTime?, List<Event>>? value, GetMarkedDateMap action) => action.markedDateMap;

Reducer<DateTime?> daySelectedReducer = combineReducers([
  TypedReducer<DateTime?, ChangeDaySelected>(_changeSelectedDay),
]);
DateTime _changeSelectedDay(DateTime? value, ChangeDaySelected action) => action.selectedDay;

Reducer<DateTime?> focusedDayReducer = combineReducers([
  TypedReducer<DateTime?, ChangeFocusedDay>(_changeFocusedDay),
]);
DateTime _changeFocusedDay(DateTime? value, ChangeFocusedDay action) => action.focusedDay;

Reducer<DateTime?> rangeStartReducer = combineReducers([
  TypedReducer<DateTime?, ChangeRangeStart>(_changeRangeStart),
]);
DateTime _changeRangeStart(DateTime? value, ChangeRangeStart action) => action.rangeStart;

Reducer<DateTime?> rangeEndReducer = combineReducers([
  TypedReducer<DateTime?, ChangeRangeEnd>(_changeRangeEnd),
]);
DateTime _changeRangeEnd(DateTime? value, ChangeRangeEnd action) => action.rangeEnd;

Reducer<RangeSelectionMode> rangeSelectionModeReducer = combineReducers([
  TypedReducer<RangeSelectionMode, ChangeRangeSelectionMode>(_changeSelectionMode),
]);
RangeSelectionMode _changeSelectionMode(RangeSelectionMode value, ChangeRangeSelectionMode action) => action.rangeSelectionMode;

Reducer<CalendarFormat> calendarFormatReducer = combineReducers([
  TypedReducer<CalendarFormat, ChangeCalendarFormat>(_changeCalendarFormat),
]);
CalendarFormat _changeCalendarFormat(CalendarFormat value, ChangeCalendarFormat action) => action.calendarFormat;

Reducer<List<Event>> selectedEventsReducer = combineReducers([
  TypedReducer<List<Event>, ChangeSelectedEvents>(_changeSelectedEvents),
  TypedReducer<List<Event>, ClearSelectedEvents>(_clearSelectedEvents),
]);
List<Event> _changeSelectedEvents(List<Event> value, ChangeSelectedEvents action) => action.events;
List<Event> _clearSelectedEvents(List<Event> value, ClearSelectedEvents action){
  value.clear();
  return <Event>[];
}

Reducer<Event> currentVisitReducer = combineReducers([
  TypedReducer<Event, ChangeCurrentVisitAction>(_changeCurrentVisit),
  TypedReducer<Event, ResetCurrentVisitAction>(_resetCurrentVisit),
]);
Event _resetCurrentVisit(Event value, ResetCurrentVisitAction action) => const Event.initialState();
Event _changeCurrentVisit(Event value, ChangeCurrentVisitAction action) => action.visitModel;