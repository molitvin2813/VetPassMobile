import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/CalendarPage/Widget/Calendar.dart';
import 'package:vet_pass/Pages/CalendarPage/Widget/EventList.dart';

import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Redux/AppState.dart';
import '../../Redux/CalendarPage/CalendarPageState.dart';


class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);


    return  StoreConnector<AppState, CalendarPageState>(
      converter: (store) => store.state.calendarPageState,
      builder: (context, calendarPageState) =>Container(
          decoration: const BoxDecoration(

            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(101, 159, 226, 1),
                Color.fromRGBO(240, 240, 240, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
            image: DecorationImage(
                image: AssetImage('assets/images/loginBG.png'), fit: BoxFit.cover),
          ),
        child :
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white70,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 30),
              child: Calendar(),
            ),
            Expanded(flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: EventList(),
              ),
            )
          ],

        )
      )
    );
  }
}
