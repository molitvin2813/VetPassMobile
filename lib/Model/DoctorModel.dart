import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/VisitModel.dart';

@immutable
class DoctorModel {
  final int iddoctorTable;
  final int? isAdmin;
  final String? fio;
  final String? color;
  final double? salary;
  final String? login;
  final String? password;
  final List<VisitModel>? visitTables;

  const DoctorModel({
    required this.iddoctorTable,
    this.color,
    this.password,
    this.login,
    this.fio,
    this.visitTables,
    this.isAdmin,
    this.salary,
  });

  const DoctorModel.initialState()
      : iddoctorTable = -1,
        color = "#FFFFFF",
        password = "",
        login = "",
        fio = "",
        isAdmin = -1,
        salary = 0,
        visitTables = const <VisitModel>[];

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    var visitList;
    var temp = json['visitTables']?.map((model) => VisitModel.fromJson(model));

    if (temp != null) {
      visitList = List<VisitModel>.from(temp);
    }
    return DoctorModel(
      iddoctorTable: json['iddoctorTable'],
      color: json['color'],
      password: json['password'],
      login: json['login'],
      fio: json['fio'],
      isAdmin: json['isAdmin'],
      salary: double.tryParse(json['salary']?? ''),
      visitTables: visitList,
    );
  }
}
