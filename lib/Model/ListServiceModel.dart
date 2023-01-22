import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/MaterialModel.dart';
import 'package:vet_pass/Model/ReceiptModel.dart';
import 'package:vet_pass/Model/ServiceModel.dart';

@immutable
class ListServiceModel {
  final int idListService;
  final int? idService;
  final int? idReceipt;
  final double? count;
  final double? sum;
  final ServiceModel? idService2;
  final ReceiptModel? idReceipt2;

  const ListServiceModel(
      {
        required this.idListService,
        this.count,
        this.sum,
        this.idReceipt2,
        this.idReceipt,
        this.idService,
        this.idService2
      }
      );

  const ListServiceModel.initialState()
      : idListService = -1,
        sum = 0,
        idReceipt2 = const ReceiptModel.initialState(),
        idReceipt = -1,
        count = 0.0,
        idService = -1,
        idService2 = const ServiceModel.initialState();

  factory ListServiceModel.fromJson(Map<String, dynamic> json) {
    return ListServiceModel(
      idListService: json['idListService'],
      sum: json['sum'],
      idReceipt2: ReceiptModel.fromJson(json['idReceipt2']),
      idReceipt: json['idReceipt'],
      count: json['count'],
      idService: json['idService'],
      idService2: ServiceModel.fromJson(json['idService2']),
    );
  }
}