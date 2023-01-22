import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/MainPage/MainPageState.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../../Redux/AnimalPage/AnimalPageAction.dart';
import '../../../Redux/AppState.dart';
import '../../../Redux/CalendarPage/CalendarPageAction.dart';
import '../../../Redux/ChatRoomPage/ChatRoomPageAction.dart';
import '../../../Redux/MainPage/MainPageActions.dart';
import '../../../Redux/NewsPage/NewsPageAction.dart';
import '../../../Redux/ProfilePage/ProfilePageAction.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final Size size = MediaQuery.of(context).size;

    int currentIndex = 0;
    //store.dispatch(getAnimalListThunkAction(store));
    return StoreConnector<AppState, MainPageState>(
        converter: (store) => store.state.mainPageState,
        builder: (context, mainPageState) => Container(
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: size.width,
                      height: 80,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(size.width, 80),
                            painter: BNBCustomPainter(),
                          ),
                          Center(
                            heightFactor: 0.6,
                            child: FloatingActionButton(
                                backgroundColor: primaryLightColor,
                                elevation: 10,
                                onPressed: () {
                                  //store.dispatch(navigateMainPageThunkAction(store));
                                  store.dispatch(ChangeNavBarIndex(4));
                                  store.dispatch(getAnimalThunkAction(
                                      store as Store<AppState>));
                                  store.dispatch(
                                      getPrescriptionThunkAction(store));

                                  store.dispatch(ChangeAnimalImage());
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.paw,
                                  color: primaryColor,
                                  size: 36,
                                )),
                          ),
                          Container(
                            width: size.width,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.house,
                                    size: 24,
                                    color:
                                        store.state.mainPageState.indexNavBar ==
                                                0
                                            ? primaryLightColor
                                            : Colors.grey.shade400,
                                  ),
                                  onPressed: () {
                                    store.dispatch(ClearListNewsAction());
                                    store.dispatch(ClearPageAction());
                                    store.dispatch(IsAllLoadAction());
                                    store.dispatch(ClearCurrentTypeIDAction());
                                    store.dispatch(
                                        getNewsListThunkAction(store));
                                    store.dispatch(ChangeNavBarIndex(0));
                                  },
                                  splashColor: Colors.white,
                                ),
                                IconButton(
                                    icon: FaIcon(
                                      store.state.mainPageState.indexNavBar == 1
                                          ? FontAwesomeIcons.solidCalendarDays
                                          : FontAwesomeIcons.calendarDays,
                                      size: 24,
                                      color: store.state.mainPageState
                                                  .indexNavBar ==
                                              1
                                          ? primaryLightColor
                                          : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      store
                                          .dispatch(getVisitThunkAction(store));
                                      store.dispatch(ChangeNavBarIndex(1));
                                    }),
                                Container(
                                  width: size.width * 0.20,
                                ),
                                Stack(children: <Widget>[
                                  IconButton(
                                      icon: FaIcon(
                                        store.state.mainPageState.indexNavBar ==
                                                2
                                            ? FontAwesomeIcons.solidMessage
                                            : FontAwesomeIcons.message,
                                        size: 24,
                                        color: store.state.mainPageState
                                                    .indexNavBar ==
                                                2
                                            ? primaryLightColor
                                            : Colors.white70,
                                      ),
                                      onPressed: () {
                                        store.dispatch(
                                            getChatRoomListThunkAction(store));
                                        store.dispatch(ChangeNavBarIndex(2));
                                      }),
                                  Positioned(
                                      top: 5.0,
                                      right: 8.0,
                                      child: Center(
                                        child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Center(
                                              child: Text(
                                                mainPageState.countMessage > 9
                                                    ? '9+'
                                                    : mainPageState.countMessage
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey.shade400,
                                                    fontSize: 11.0,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )),
                                      )),
                                ]),
                                IconButton(
                                    icon: FaIcon(
                                      store.state.mainPageState.indexNavBar == 3
                                          ? FontAwesomeIcons.solidUser
                                          : FontAwesomeIcons.user,
                                      size: 24,
                                      color: store.state.mainPageState
                                                  .indexNavBar ==
                                              3
                                          ? primaryLightColor
                                          : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      store.dispatch(
                                          getClientThunkAction(store));
                                      store.dispatch(ChangeNavBarIndex(3));
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
