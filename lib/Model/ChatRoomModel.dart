import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Model/DoctorModel.dart';

@immutable
class ChatRoomModel {
  final int idChatRoom;
  final int? countUnreadMessage;
  final String? nameRoom;
  final DateTime? dateCreated;
  final DateTime? lastMessageDate;

  const ChatRoomModel(
      {
        required this.idChatRoom,
        this.dateCreated,
        this.countUnreadMessage,
        this.nameRoom,
        this.lastMessageDate,
      }
      );

  const ChatRoomModel.initialState()
      : idChatRoom = -1,
        dateCreated = null,
        countUnreadMessage = -1,
        nameRoom = '',
        lastMessageDate = null;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      idChatRoom: json['idChatRoom'],
      dateCreated: DateTime.tryParse(json['dateCreated'] ?? ''),
      countUnreadMessage: json['countUnreadMessage'],
      nameRoom: json['name'],
      lastMessageDate: DateTime.tryParse(json['lastMessageDate'] ?? ''),
    );
  }
}