import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

@immutable
class ClientModel {
  final int? idClient;
  final String? fio;
  final String? phone;
  final String? email;
  final String? comment;
  final String? login;
  final String? password;
  final List<AnimalModel>? animalTables;

  const ClientModel({
    this.idClient,
    this.fio,
    this.phone,
    this.email,
    this.comment,
    this.login,
    this.password,
    this.animalTables,
  });

  const ClientModel.initialState()
      : idClient = -1,
        fio = "",
        phone = "",
        email = "",
        comment = "",
        login = "",
        password = "",
        animalTables = const <AnimalModel>[];

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    var animalList = null;
    var temp =
        json['animalTables']?.map((model) => AnimalModel.fromJson(model));

    if (temp != null) {
      animalList = List<AnimalModel>.from(temp);
    }
    return ClientModel(
      idClient: json['idClient'],
      fio: json['fio'],
      phone: json['phone'],
      email: json['email'],
      comment: json['comment'],
      login: json['login'],
      password: json['password'],
      animalTables: animalList,
    );
  }

  Map<String, dynamic> toJson() {
    if (password != null) {
      return {
        'fio': fio ?? '',
        'phone': phone ?? '',
        'email': email ?? '',
        'login': login ?? '',
        'password': password ?? '',
      };
    } else {
      return {
        'fio': fio ?? '',
        'phone': phone ?? '',
        'email': email ?? '',
        'login': login ?? '',
      };
    }
  }
}
