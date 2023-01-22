import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';
import 'package:vet_pass/Model/SupportModel/Event.dart';
import '../../Model/VisitModel.dart';
import '../../Variables/Utils.dart';
import '../PrescriptionsListPage/PrescriptionPageAction.dart';

class GetVisitAction {
  final List<VisitModel> visit;
  GetVisitAction(this.visit);
}

class GetMarkedDateMap{
  final LinkedHashMap<DateTime?, List<Event>>? markedDateMap;
  GetMarkedDateMap(this.markedDateMap);
}

class IsLoad{}
class IsLoaded{}

class ChangeDaySelected{
  DateTime selectedDay;
  ChangeDaySelected(this.selectedDay);
}
class ChangeFocusedDay{
  DateTime focusedDay;
  ChangeFocusedDay(this.focusedDay);
}
class ChangeRangeStart{
  DateTime rangeStart;
  ChangeRangeStart(this.rangeStart);
}
class ChangeRangeEnd{
  DateTime rangeEnd;
  ChangeRangeEnd(this.rangeEnd);
}

class ChangeRangeSelectionMode{
  RangeSelectionMode rangeSelectionMode;
  ChangeRangeSelectionMode(this.rangeSelectionMode);
}
class ChangeCalendarFormat{
  CalendarFormat calendarFormat;
  ChangeCalendarFormat(this.calendarFormat);
}

class ChangeSelectedEvents{
  List<Event> events;
  ChangeSelectedEvents(this.events);
}
class ClearSelectedEvents{}

class ChangeCurrentVisitAction{
  Event visitModel;
  ChangeCurrentVisitAction(this.visitModel);
}
class ResetCurrentVisitAction{}

ThunkAction<AppState> navigateToPrescriptionPageThunkAction = (Store store) {
  store.dispatch(NavigateToAction.push("/prescriptionPage",
      preNavigation: () {
        store.dispatch(getPrescriptionListPageThunkAction(store as Store<AppState>));
      }));
};

ThunkAction<AppState> getVisitThunkAction = (Store store) async {
  store.dispatch(IsLoad());
  await _getVisit(store.state).then((value){
    store.dispatch(GetVisitAction(value));
    store.dispatch(IsLoaded());
  });
  await _getMarkedMap(store.state).then((value) => store.dispatch(GetMarkedDateMap(value)));
};

Future<LinkedHashMap<DateTime?, List<Event>>> _getMarkedMap(AppState state) async{
  List<DateTime> date = <DateTime>[];

  for (var element in state.calendarPageState.visit) {
    if( element.visitTime!=null){
      if(!date.contains(element.visitTime)) {
        date.add(element.visitTime as DateTime);
      }
    }
  }

  Map<DateTime?, List<Event>> myMap = {};
  List<Event> event = <Event>[];

  for (var value in date) {
    event = <Event>[];
    for (var element in state.calendarPageState.visit) {
      if(element.visitTime == value) {
        event.add(
          Event(
            diagnosis: element.idDiagnosis2?.diagnos ?? "",
            idvisitTable: element.idvisitTable,
            doctorName: element.idDoctor2?.fio??"",
            time: element.time ?? "",
            visitTime: element.visitTime,
          )
        );
      }
    }
    myMap[value] = event;
  }

  LinkedHashMap<DateTime?, List<Event>> markedDateMap = LinkedHashMap<DateTime?, List<Event>>(
    equals: isSameDay,
    hashCode: (date)=> getHashCode(date as DateTime),
  )..addAll(myMap);

  return markedDateMap;
}

Future<List<VisitModel>> _getVisit(AppState state) async{
  List<VisitModel> result = <VisitModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
        Uri.parse('${baseUrlApi}visit/animal/completed/${state.selectAnimalState.currentAnimal.idAnimal}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){
      Iterable l = jsonDecode(response.body);
      List<VisitModel> posts = List<VisitModel>.from(l.map((model)=> VisitModel.fromJson(model)));

      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}