import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Redux/CalendarPage/CalendarPageAction.dart';
import '../../../Redux/AppState.dart';
import '../../../Redux/CalendarPage/CalendarPageState.dart';



class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return  StoreConnector<AppState, CalendarPageState>(
      converter: (store) => store.state.calendarPageState,
      builder: (context, calendarPageState) => Container(
        child : TableCalendar(
          locale: 'ru',
          focusedDay: calendarPageState.focusedDay ?? DateTime.now(),
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          startingDayOfWeek: StartingDayOfWeek.monday,
          eventLoader: (day) => calendarPageState.markedDateMap?[day] ??[],
          //rangeStartDay: calendarPageState.rangeStart,
          //rangeEndDay: calendarPageState.rangeEnd,
          calendarFormat: calendarPageState.calendarFormat,
          //rangeSelectionMode: calendarPageState.rangeSelectionMode,
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            print(Localizations.localeOf(context).languageCode);
            store.dispatch(ChangeFocusedDay(focusedDay));
            store.dispatch(ChangeDaySelected(selectedDay));
            store.dispatch(ChangeSelectedEvents(calendarPageState.markedDateMap?[selectedDay] ??[]));
          },
          onFormatChanged: (format) {
            store.dispatch(ChangeCalendarFormat(format));
          },
          onPageChanged: (focusedDay) {

            store.dispatch(ChangeFocusedDay(focusedDay));

          },
          calendarStyle: const CalendarStyle(
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: false,

          ),
          selectedDayPredicate: (day) =>
              isSameDay(calendarPageState.selectedDay, day),
        )
      )
    );
  }
}
