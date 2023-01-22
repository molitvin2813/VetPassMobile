import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

@immutable
class ServiceModel {
  final int idserviceListTable;
  final String? name;
  final double? cost;
  final String? comment;
  const ServiceModel(
    {
      required this.idserviceListTable,
      this.comment,
      this.name,
      this.cost,
    }
  );

  const ServiceModel.initialState()
    : idserviceListTable = -1,
      comment = "",
      name = "",
      cost = 0.0;

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      idserviceListTable: json['idserviceListTable'],
      comment: json['comment'],
      name: json['name'],
      cost: json['cost'],
    );
  }
}