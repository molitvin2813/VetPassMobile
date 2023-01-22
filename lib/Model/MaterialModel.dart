import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

@immutable
class MaterialModel {
  final int idmaterialListTable;
  final String? name;
  final double? cost;
  final String? comment;
  final double? count;
  final String? measure;
  final int? expirationDate;

  const MaterialModel(
    {
      required this.idmaterialListTable,
      this.comment,
      this.name,
      this.cost,
      this.count,
      this.expirationDate,
      this.measure
    }
  );

  const MaterialModel.initialState()
    : idmaterialListTable = -1,
      comment = "",
      name = "",
      cost = 0.0,
      count = 0.0,
      expirationDate = 0,
      measure = "";

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      idmaterialListTable: json['idmaterialListTable'],
      comment: json['comment'],
      name: json['name'],
      cost: json['cost'],
      count: json['count'],
      expirationDate: json['expirationDate'],
      measure: json['measure'],
    );
  }
}