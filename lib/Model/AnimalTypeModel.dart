import 'package:flutter/cupertino.dart';

@immutable
class AnimalTypeModel {
  final int? idType;
  final String? type;

  const AnimalTypeModel(
    {
      this.idType,
      this.type
    }
  );

  factory AnimalTypeModel.fromJson(Map<String, dynamic> json) {
    return AnimalTypeModel(
        idType: json['idType'],
        type: json['type']
    );
  }

  const AnimalTypeModel.initialState()
      : idType = -1,
        type = "";
}