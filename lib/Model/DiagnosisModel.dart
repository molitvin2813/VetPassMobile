import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/VisitModel.dart';

@immutable
class DiagnosisModel {
  final int idDiagnos;
  final String? diagnos;


  const DiagnosisModel(
    {
      required this.idDiagnos,
      this.diagnos,

    }
  );

  const DiagnosisModel.initialState()
      : idDiagnos = -1,
        diagnos = "";

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      idDiagnos: json['idDiagnos'],
      diagnos: json['diagnos'],

    );
  }
}