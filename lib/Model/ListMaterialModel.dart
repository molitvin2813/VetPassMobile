import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/MaterialModel.dart';
import 'package:vet_pass/Model/ReceiptModel.dart';

@immutable
class ListMaterialModel {
  final int idListMaterial;
  final int? idMaterial;
  final int? idReceipt;
  final double? count;
  final double? sum;
  final MaterialModel? idMaterial2;
  final ReceiptModel? idReceipt2;

  const ListMaterialModel(
      {
        required this.idListMaterial,
        this.count,
        this.sum,
        this.idReceipt2,
        this.idReceipt,
        this.idMaterial,
        this.idMaterial2
      }
      );

  const ListMaterialModel.initialState()
      : idListMaterial = -1,
        sum = 0,
        idReceipt2 = const ReceiptModel.initialState(),
        idReceipt = -1,
        count = 0.0,
        idMaterial = -1,
        idMaterial2 = const MaterialModel.initialState();

  factory ListMaterialModel.fromJson(Map<String, dynamic> json) {
    return ListMaterialModel(
      idListMaterial: json['idListMaterial'],
      sum: json['sum'],
      idReceipt2: ReceiptModel.fromJson(json['idReceipt2']),
      idReceipt: json['idReceipt'],
      count: json['count'],
      idMaterial: json['idMaterial'],
      idMaterial2: MaterialModel.fromJson(json['idMaterial2']),
    );
  }
}