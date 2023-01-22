import 'package:flutter/cupertino.dart';
import '../../Model/ListUserChatModel.dart';

@immutable
class ChatRoomPageState{
  final List<ListUserChatModel> chatRoomList;
  final ListUserChatModel currentChatRoom;
  final int isLoadingChatRoomPage;
  final List<DateTime> lastDateMessageList;

  const ChatRoomPageState(
      {
        required this.chatRoomList,
        required this.isLoadingChatRoomPage,
        required this.currentChatRoom,
        required this.lastDateMessageList,
      });

  const ChatRoomPageState.initialState()
      : chatRoomList = const <ListUserChatModel>[],
        isLoadingChatRoomPage = 0,
        currentChatRoom = const ListUserChatModel.initialState(),
        lastDateMessageList = const<DateTime>[];
}