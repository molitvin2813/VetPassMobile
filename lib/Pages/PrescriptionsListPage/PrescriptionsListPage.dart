import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:vet_pass/Redux/CalendarPage/CalendarPageState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../Redux/AppState.dart';
import './Widget/PrescriptionList.dart';

class PrescriptionListPage extends StatelessWidget {
  const PrescriptionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, CalendarPageState>(
        converter: (store) => store.state.calendarPageState,
        builder: (context, calendarPageState) => Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(107, 211, 248, 1),
                image: DecorationImage(
                    image: AssetImage('assets/images/loginBG.png'),
                    fit: BoxFit.cover),
              ),
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: const BackButton(),
                ),
                backgroundColor: Colors.transparent,
                body: Stack(children: [
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 0, top: 50),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Список ваших предписаний на \n ${DateFormat.yMMMMd('ru').format(calendarPageState.currentVisit.visitTime ?? DateTime.now())}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                shadows: [
                                  Shadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(3, 2))
                                ],
                                fontSize: 36,
                                fontFamily: 'Lumberjack',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      const Expanded(child: PrescriptionList()),
                    ],
                  ),
                ]),
              ),
            ));
  }
}
