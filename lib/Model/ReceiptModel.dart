import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

import 'ListMaterialModel.dart';
import 'ListServiceModel.dart';
import 'MaterialModel.dart';
import 'ServiceModel.dart';
import 'VisitModel.dart';

@immutable
class ReceiptModel {
  final int idReceipt;
  final String? comment;
  final double? sum;
  final DateTime? date;
  final double? discount;
  //final VisitModel? visitTable;
  final List<ListServiceModel>? listServiceModelTables;
  final List<ListMaterialModel>? listMaterialTables;
  final List<ServiceModel>? serviceTable;
  final List<MaterialModel>? materialTable;

  const ReceiptModel(
    {
      required this.idReceipt,
      this.comment,
      this.date,
      this.discount,
      this.listMaterialTables,
      this.listServiceModelTables,
      this.materialTable,
      this.serviceTable,
      this.sum,
      //this.visitTable,
    }
  );

  const ReceiptModel.initialState()
    : idReceipt = -1,
      comment = "",
      date = null,
      //visitTable = const VisitModel.initialState(),
      sum = 0.0,
      discount = 0,
      listMaterialTables = const <ListMaterialModel>[],
      listServiceModelTables = const <ListServiceModel>[],
      serviceTable = const <ServiceModel>[],
      materialTable = const <MaterialModel>[];


  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    var material = null;
    var listMaterial = null;
    var listServiceModel = null;
    var service = null;

    var temp = json['materialTable']?.map((model)=> MaterialModel.fromJson(model));

    if(temp != null) {
      material = List<MaterialModel>.from(temp);
    }

    temp = json['listMaterialTables']?.map((model)=> ListMaterialModel.fromJson(model));
    if(temp != null) {
      listMaterial = List<ListMaterialModel>.from(temp);
    }

    temp = json['listServiceModelTables']?.map((model)=> ListServiceModel.fromJson(model));
    if(temp != null) {
      listServiceModel = List<ListServiceModel>.from(temp);
    }

    temp = json['serviceTable']?.map((model)=> ServiceModel.fromJson(model));
    if(temp != null) {
      service = List<ServiceModel>.from(temp);
    }


    return ReceiptModel(
      idReceipt: json['idReceipt'],
      comment: json['comment'],
      date: DateTime.tryParse(json['date']),
      //visitTable: json['visitTable'],
      sum: double.tryParse(json['sum']),
      discount: double.tryParse(json['discount']),
      listMaterialTables: listMaterial,
      listServiceModelTables: listServiceModel,
      serviceTable: service,
      materialTable: material,
    );
  }
}