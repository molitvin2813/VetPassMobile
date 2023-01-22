import 'dart:convert';
import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/ChatRoomModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import '../../Model/ListUserChatModel.dart';
import '../ChatMessagePage/ChatMessagePageAction.dart';
import '../NewsPage/NewsPageAction.dart';

class ChangeChatRoomListAction {
  final List<ListUserChatModel> listChatRoom;

  ChangeChatRoomListAction(this.listChatRoom);
}

class ClearChatRoomListAction {}

class ChangeCurrentChatRoomAction {
  final ListUserChatModel chatRoomModel;

  ChangeCurrentChatRoomAction(this.chatRoomModel);
}

class ClearCurrentChatRoomAction {}

class IsLoad {}

class IsLoaded {}

class ChangeLastDateMessageList {
  final List<DateTime> lastDateMessageList;

  ChangeLastDateMessageList(this.lastDateMessageList);
}

class ClearLastDateMessageList {}

ThunkAction<AppState> readChatThunkAction = (Store store) async {
  _readChat(store.state);
};

Future<void> _readChat(AppState state) async {
  List<ListUserChatModel> result = <ListUserChatModel>[];
  var client = http.Client();
  try {
    await client.put(
        Uri.parse(
            '${baseUrlApi}list-user-chat-table/${state.chatRoomPageState.currentChatRoom.idListUserChat}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: json.encode(<String, String>{'countUnreadMessages': '0'}));
  } finally {
    client.close();
  }
}

ThunkAction<AppState> navigateChatRoomThunkAction = (Store store) async {
  store.dispatch(NavigateToAction.push("/chatMessage", postNavigation: () {
    store.dispatch(getChatMessageListThunkAction(store as Store<AppState>));
  }));
};

ThunkAction<AppState> getChatRoomListThunkAction = (Store store) async {
  store.dispatch(IsLoad());
  _getChatRoomList(store.state).then((value) {
    store.dispatch(ChangeChatRoomListAction(value));
    print(value);
    store.dispatch(IsLoaded());
  });
};

Future<List<ListUserChatModel>> _getChatRoomList(AppState state) async {
  List<ListUserChatModel> result = <ListUserChatModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
      Uri.parse('${baseUrlApi}list-user-chat-table/client/$idClient'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      Iterable temp = jsonDecode(response.body);
      List<ListUserChatModel> posts = List<ListUserChatModel>.from(
          temp.map((model) => ListUserChatModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}
