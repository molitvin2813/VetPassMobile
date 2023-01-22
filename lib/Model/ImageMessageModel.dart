import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/ChatMessageModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';

@immutable
class ImageMessageModel {
  final int? idImageMessage;
  final String? path;
  final ChatMessageModel? idMessage2;
  final int? idMessage;

  const ImageMessageModel(
      {
        this.idImageMessage,
        this.idMessage2,
        this.idMessage,
        this.path,
      }
      );

  const ImageMessageModel.initialState()
      : idImageMessage = -1,
        path = "",
        idMessage = -1,
        idMessage2 = const ChatMessageModel.initialState();



  Map<String, dynamic> toJson() {
    return {
      'idImageMessage': idImageMessage.toString(),
      'idMessage': idMessage.toString(),
      'path': path,
    };
  }

  factory ImageMessageModel.fromJson(Map<String, dynamic> json) {

    return ImageMessageModel(
      idImageMessage: json['idImageMessage'] == null ? null : int.tryParse(json['idImageMessage'].toString()),
      path: json['path'],
      idMessage: json['idMessage'],
      idMessage2: json['idMessage2'] == null ? null : ChatMessageModel.fromJson(json['idMessage2']),
    );
  }
}