import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/ClientModel.dart';

import 'AnimalTypeModel.dart';

@immutable
class AnimalModel{
  final int? idAnimal;
  final String? name;
  final String? gender;
  final int? isCastrated;
  final double? weight;
  final int? age;
  final int? idType;
  final int? idClient;
  final AnimalTypeModel? idType2;
  final ClientModel? idClient2;

  const AnimalModel
  (
    {
      this.idAnimal,
      this.name,
      this.gender,
      this.isCastrated,
      this.weight,
      this.age,
      this.idType2,
      this.idClient2,
      this.idClient,
      this.idType,
    }
  );


  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      idAnimal: json['idAnimal'],
      name: json['name'],
      gender: json['gender'],
      isCastrated: json['isCastrated'],
      weight: double.parse(json['weight'].toString()),
      age: json['age'],
      idType2: json['idType2'] == null ? null :  AnimalTypeModel.fromJson(json['idType2']),
      idClient2: json['idClient2'] == null ? null : ClientModel.fromJson(json['idClient2']),
      idClient: json['idClient'],
      idType: json['idType'],
    );
  }

  const AnimalModel.initialState()
      : idAnimal = -1,
        name = "",
        gender = "Самец",
        isCastrated = -1,
        weight = -1,
        idClient = -1,
        idType = -1,
        age = -1,
        idType2 = const AnimalTypeModel.initialState(),
        idClient2 = const ClientModel.initialState();



  Map<String, dynamic> toJson() {
      return {
        'name': name ?? '',
        'gender': gender ?? '',
        'isCastrated': isCastrated ?? '',
        'weight': weight ?? '',
        'idType': idType ?? '',
        'idClient': idClient ?? '',
        'age': age ?? '',
      };
  }

}