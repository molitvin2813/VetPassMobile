import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';
import 'package:vet_pass/Model/PrescriptionModel.dart';

@immutable
class TypePrescriptionModel{
  final int idTypePrescription;
  final String? type;
  final String? color;
  final List<PrescriptionModel>? prescriptionTables;

  const TypePrescriptionModel(
      {
        required this.idTypePrescription,
        this.prescriptionTables,
        this.type,
        this.color,
      }
      );

  const TypePrescriptionModel.initialState()
      : idTypePrescription = -1,
        color = "",
        type = "",
        prescriptionTables = const <PrescriptionModel>[];

  factory TypePrescriptionModel.fromJson(Map<String, dynamic> json) {
    var list = null;
    var temp =json['prescriptionTables']?.map((model)=> PrescriptionModel.fromJson(model));

    if(temp != null) {
      list = List<PrescriptionModel>.from(temp);
    }
    return TypePrescriptionModel(
      idTypePrescription: json['idTypePrescription'],
      type: json['type'],
      color: json['color'],
      prescriptionTables: list,
    );
  }
}