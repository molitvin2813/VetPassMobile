import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/ChatRoomModel.dart';
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Model/DoctorModel.dart';
import 'package:vet_pass/Model/ImageMessageModel.dart';
import 'package:vet_pass/Pages/ChatRoomPage/ChatRoomPage.dart';

@immutable
class ChatMessageModel {
  final int? idMessage;
  final String? message;
  final int? idChatRoom;
  final int? idDoctor;
  final int? idClient;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;
  final ChatRoomModel? idChatRoom2;
  final ClientModel? idClient2;
  final DoctorModel? idDoctor2;
  final List<ImageMessageModel>? imageMessageTables;

  const ChatMessageModel({
    this.idMessage,
    this.dateCreated,
    this.dateUpdated,
    this.message,
    this.idChatRoom,
    this.idChatRoom2,
    this.idClient,
    this.idClient2,
    this.idDoctor2,
    this.idDoctor,
    this.imageMessageTables,
  });

  const ChatMessageModel.initialState()
      : idChatRoom = -1,
        idMessage = -1,
        dateCreated = null,
        dateUpdated = null,
        message = '',
        idChatRoom2 = const ChatRoomModel.initialState(),
        idClient = -1,
        idDoctor = -1,
        idDoctor2 = const DoctorModel.initialState(),
        idClient2 = const ClientModel.initialState(),
        imageMessageTables = const <ImageMessageModel>[];

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    var list = null;
    var temp = json['imageMessageTables']
        ?.map((model) => ImageMessageModel.fromJson(model));

    if (temp != null) {
      list = List<ImageMessageModel>.from(temp);
    }

    return ChatMessageModel(
      idChatRoom:
          json['idChatRoom'] == null ? null : int.tryParse(json['idChatRoom'].toString()),
      dateCreated: DateTime.tryParse(json['dateCreated']),
      dateUpdated: DateTime.tryParse(json['dateUpdated']),
      idMessage: json['idMessage'],
      idClient: json['idClient'] == null ? null : int.tryParse(json['idClient'].toString()),
      idDoctor: json['idDoctor'],
      idDoctor2: json['idDoctor2'] == null
          ? null
          : DoctorModel.fromJson(json['idDoctor2']),
      idClient2: json['idClient2'] == null
          ? null
          : ClientModel.fromJson(json['idClient2']),
      idChatRoom2: json['idChatRoom2'] == null
          ? null
          : ChatRoomModel.fromJson(json['idChatRoom2']),
      message: json['message'],
      imageMessageTables: list,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message ?? '',
      'idChatRoom': idChatRoom.toString(),
      'idClient':  idClient.toString() ?? '',
    };
  }
}
