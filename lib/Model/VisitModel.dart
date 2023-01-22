import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

import 'DiagnosisModel.dart';
import 'DoctorModel.dart';
import 'ReceiptModel.dart';

@immutable
class VisitModel {
  final int idvisitTable;
  final String? name;
  final int? isCompleted;
  final String? anamnesis;
  final int? idDiagnosis;
  final DateTime? visitTime;
  final String? time;
  final int? idAnimal;
  final int? idDoctor;
  final int? idReceipt;
  final AnimalModel? idAnimal2;
  final DoctorModel? idDoctor2;
  final ReceiptModel? idReceipt2;
  final DiagnosisModel? idDiagnosis2;

  const VisitModel(
      {
        required this.idvisitTable,
        this.name,
        this.isCompleted,
        this.anamnesis,
        this.idDiagnosis,
        this.visitTime,
        this.time,
        this.idAnimal,
        this.idAnimal2,
        this.idDoctor,
        this.idDoctor2,
        this.idReceipt,
        this.idReceipt2,
        this.idDiagnosis2,
      }
      );

  const VisitModel.initialState()
      : idvisitTable = -1,
        name = "",
        isCompleted = -1,
        anamnesis = "",
        idDiagnosis = -1,
        visitTime = null,
        time = "",
        idAnimal = -1,
        idAnimal2 = const AnimalModel.initialState(),
        idDoctor = -1,
        idDoctor2  =const DoctorModel.initialState(),
        idReceipt = -1,
        idReceipt2 = const ReceiptModel.initialState(),
        idDiagnosis2 = const DiagnosisModel.initialState();


  factory VisitModel.fromJson(Map<String, dynamic> json) {

    return VisitModel(
      idvisitTable: json['idvisitTable'],
      name: json['name'],
      isCompleted: json['isCompleted'],
      anamnesis: json['anamnesis'],
      idDiagnosis: json['idDiagnosis'],
      visitTime: DateTime.parse(json['visitTime']),
      time: json['time'],
      idAnimal: json['idAnimal'],
      idAnimal2: json['idAnimal2'] == null? null:  AnimalModel.fromJson(json['idAnimal2']),
      idDoctor: json['idDoctor'],
      idDoctor2: json['idDoctor2'] == null? null : DoctorModel.fromJson(json['idDoctor2']),
      idReceipt: json['idReceipt'],
      idReceipt2: json['idReceipt2'] == null ? null : ReceiptModel.fromJson(json['idReceipt2']),
      idDiagnosis2: json['idDiagnosis2'] == null ? null : DiagnosisModel.fromJson(json['idDiagnosis2'])
    );
  }
}