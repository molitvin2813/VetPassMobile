import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/ChatRoomPage/Widget/ChatRoomList.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../Redux/AppState.dart';
import '../../Redux/SelectAnimalPage/SelectAnimalActions.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Container(
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
      child: const ChatRoomList(),
    );
  }
}
