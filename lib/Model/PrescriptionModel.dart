import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/TypePrescriptionModel.dart';
import 'package:vet_pass/Model/VisitModel.dart';

@immutable
class PrescriptionModel {
  final int idPrescription;
  final String? title;
  final String? description;
  final int? idVisit;
  final int? idTypePrescription;
  final TypePrescriptionModel? idTypePrescription2;

  const PrescriptionModel(
      {
        required this.idPrescription,
        this.idVisit,
        this.title,
        this.description,
        this.idTypePrescription,
        this.idTypePrescription2,
      }
      );

  const PrescriptionModel.initialState()
      : idPrescription = -1,
        description = "",
        title = "",
        idVisit = -1,
        idTypePrescription= -1,
        idTypePrescription2 = const TypePrescriptionModel.initialState();

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    
    return PrescriptionModel(
      idPrescription: json['idPrescription'],
      title: json['title'],
      description: json['description'],
      idVisit: json['idVisit'],
      idTypePrescription: json['idTypePrescription'],
      idTypePrescription2: TypePrescriptionModel.fromJson(json['idTypePrescription2']),
    );
  }
}