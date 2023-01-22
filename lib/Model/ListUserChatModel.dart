import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/ChatRoomModel.dart';
import 'package:vet_pass/Model/ClientModel.dart';

@immutable
class ListUserChatModel {
  final int idListUserChat;
  final int? idChatRoom;
  final int? idClient;
  final int? countUnreadMessages;
  final ClientModel? idClient2;
  final ChatRoomModel? idChatRoom2;

  const ListUserChatModel(
      {
        required this.idListUserChat,
        this.idChatRoom,
        this.idClient2,
        this.idClient,
        this.idChatRoom2,
        this.countUnreadMessages,
      }
      );

  const ListUserChatModel.initialState()
      : idListUserChat = -1,
        idChatRoom = -1,
        idClient2 = const ClientModel.initialState(),
        idClient = -1,
        countUnreadMessages = -1,
        idChatRoom2 = const ChatRoomModel.initialState();

  factory ListUserChatModel.fromJson(Map<String, dynamic> json) {
    return ListUserChatModel(
      idListUserChat: json['idListUserChat'],
      idChatRoom: json['idChatRoom'],
      idClient2: ClientModel.fromJson(json['idClient2']),
      idClient: json['idClient'],
      countUnreadMessages: json['countUnreadMessages'],
      idChatRoom2: ChatRoomModel.fromJson(json['idChatRoom2']),
    );
  }
}