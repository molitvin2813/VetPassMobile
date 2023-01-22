import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';

@immutable
class TypeNewsModel {
  final int idTypeNews;
  final String? type;
  final String? color;
  final List<NewsModel>? newsTables;

  const TypeNewsModel(
      {
        required this.idTypeNews,
        this.newsTables,
        this.type,
        this.color,
      }
      );

  const TypeNewsModel.initialState()
      : idTypeNews = -1,
        color = "",
        type = "",
        newsTables = const <NewsModel>[];

  factory TypeNewsModel.fromJson(Map<String, dynamic> json) {
    var list = null;
    var temp = json['newsTables']?.map((model)=> NewsModel.fromJson(model));

    if(temp != null) {
      list = List<AnimalModel>.from(temp);
    }
    return TypeNewsModel(
      idTypeNews: json['idTypeNews'],
      type: json['type'],
      color: json['color'],
      newsTables: list,
    );
  }
}