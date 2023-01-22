import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/ChatRoomPage/ChatRoomPageAction.dart';
import 'package:vet_pass/Redux/ChatRoomPage/ChatRoomPageState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:redux/redux.dart';

class ChatRoomList extends StatelessWidget {
  const ChatRoomList({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, ChatRoomPageState>(
      converter: (store) => store.state.chatRoomPageState,
      builder: (context, chatRoomPageState) =>
          chatRoomPageState.isLoadingChatRoomPage == 1
              ? ListView(
                  padding: const EdgeInsets.only(left: 0, top: 50),
                  children: chatRoomPageState.chatRoomList
                      .map((i) => Card(
                            color: primaryLightColor,
                            child: ListTile(
                              onTap: () {
                                store.dispatch(ChangeCurrentChatRoomAction(i));
                                store.dispatch(readChatThunkAction(store));
                                store.dispatch(
                                    navigateChatRoomThunkAction(store));
                              },
                              title: Text(
                                'Название комнаты: \n${i.idChatRoom2?.nameRoom}\n\nНомер чата:\n№ ${i.idChatRoom}',
                                style: const TextStyle(
                                    fontSize: 18, color: primaryColorCard),
                              ),
                              subtitle: Text(
                                'Дата последнего сообщения: \n${DateFormat.yMMMMd('ru').add_Hm().format(i.idChatRoom2?.lastMessageDate ?? DateTime.now())}',
                                style: const TextStyle(
                                    fontSize: 14, color: primaryColorCard),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ))
                      .toList())
              : Center(
                  child: Lottie.asset(
                    'assets/images/loader.json',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                ),
    );
  }
}
