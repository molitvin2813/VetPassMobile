import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Redux/CalendarPage/CalendarPageAction.dart';
import '../../../Redux/AppState.dart';
import '../../../Redux/CalendarPage/CalendarPageState.dart';
import 'package:vet_pass/Model/SupportModel/Event.dart';

import '../../../Redux/MainPage/MainPageActions.dart';
import '../../../Redux/PrescriptionsListPage/PrescriptionPageAction.dart';
import '../../../Variables/Constants.dart';


class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return  StoreConnector<AppState, CalendarPageState>(
      converter: (store) => store.state.calendarPageState,
      builder: (context, calendarPageState) =>
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 80),
            children: calendarPageState.selectedEvents.map((value) =>
                Card(
                  color: primaryLightColor,

                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      store.dispatch(ChangeCurrentVisitAction(value));
                      store.dispatch(navigateToPrescriptionPageThunkAction(store));
                    },
                    title:  ListTile (
                      title: const Text("Диагноз: ", style: TextStyle( color: primaryColorCard, fontSize: 18, fontWeight: FontWeight.w700),),
                      subtitle: Text(value.diagnosis, style: const TextStyle(color: primaryColorCard,  fontSize: 16, ),),
                    ),
                    subtitle: ListTile (
                      title: const Text("ФИО врача: ", style: TextStyle(color: primaryColorCard,  fontSize: 18, fontWeight: FontWeight.w700),),
                      subtitle: Text(value.doctorName, style: const TextStyle( color: primaryColorCard,  fontSize: 16, ),),
                    ),
                    trailing: Container(
                      width: 100,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                      ),
                      child: Center(
                        child: Text(value.time, style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                )
            ).toList()
        ),
      )
    );
  }
}
