import 'dart:async';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:vet_pass/Redux/ChatMessagePage/ChatMessagePageState.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../Model/ChatMessageModel.dart';
import '../../Redux/AppState.dart';
import '../../Redux/ChatMessagePage/ChatMessagePageAction.dart';
import '../../Variables/Utils.dart';
import 'Widget/ImageModal.dart';
import 'Widget/Chat.dart';

class ChatMessagePage extends StatefulWidget {
  const ChatMessagePage({Key? key}) : super(key: key);

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var store = StoreProvider.of<AppState>(context);
    timer = Timer.periodic(const Duration(seconds: 5),
        (Timer t) {
          if (store.state.chatMessagePageState.isLoadingChatMessagePage == false) {
            store.dispatch(getChatMessageListThunkAction(store));
          }
        });
  }

  @override
  void deactivate() {
    super.deactivate();
    Store<AppState>? store = StoreProvider.of<AppState>(context);
    store.dispatch(ClearMessagePage());
    store.dispatch(IsLoad());
    store.dispatch(ClearChatMessageListAction());
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, ChatMessagePageState>(
      converter: (store) => store.state.chatMessagePageState,
      builder: (context, chatMessagePageState) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const BackButton(),
          ),
          body: Container(
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
                    image: AssetImage('assets/images/loginBG.png'),
                    fit: BoxFit.cover),
              ),
              child: const Chat(),
          )),
    );
  }
}
