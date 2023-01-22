import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/AnimalPage/AnimalPage.dart';
import 'package:vet_pass/Pages/ChatRoomPage/ChatRoomPage.dart';
import 'package:vet_pass/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../Redux/AppState.dart';
import '../../Redux/MainPage/MainPageActions.dart';
import '../../Redux/MainPage/MainPageState.dart';
import '../../Redux/SelectAnimalPage/SelectAnimalActions.dart';
import '../CalendarPage/CalendarPage.dart';
import '../NewsPage/NewsPage.dart';
import 'Widget/BottomNavBar.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<MainPage> {

  Timer? timer;

  final List<Widget> _listWidget = [
    const NewsPage(),
    const CalendarPage(),
    const ChatRoomPage(),
    const ProfilePage(),
    const AnimalPage(),
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var store = StoreProvider.of<AppState>(context);
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) => store.dispatch(getCountMessageThunkAction(store)));
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    store.dispatch(getAnimalListThunkAction(store));
    return StoreConnector<AppState, MainPageState>(
      converter: (store) => store.state.mainPageState,
      builder: (context, selectAnimalState) => Scaffold(
        extendBody: true,
        backgroundColor: secondaryColor,
        body: Container(
          child: _listWidget[store.state.mainPageState.indexNavBar],
        ),
        bottomNavigationBar: const BottomNavBar(),
      )
    );
  }
}
