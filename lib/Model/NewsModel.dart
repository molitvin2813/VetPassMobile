import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/TypeNewsModel.dart';

import 'ImageNewsModel.dart';

@immutable
class NewsModel {
  final int? idNews;
  final String? title;
  final String? text;
  final int? idNewsType;
  final List<ImageNewsModel>? imageNewsTables;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;
  final TypeNewsModel? idNewsType2;

  const NewsModel(
      {
        this.idNews,
        this.title,
        this.text,
        this.idNewsType,
        this.imageNewsTables,
        this.dateCreated,
        this.dateUpdated,
        this.idNewsType2,
      }
      );

  const NewsModel.initialState()
      : idNews = -1,
        title = "",
        text = "",
        idNewsType = -1,
        imageNewsTables = const <ImageNewsModel>[],
        dateCreated = null,
        dateUpdated = null,
        idNewsType2 = null;


  factory NewsModel.fromJson(Map<String, dynamic> json) {
    var list = null;
    var temp =json['imageNewsTables']?.map((model)=> ImageNewsModel.fromJson(model));

    if(temp != null) {
      list = List<ImageNewsModel>.from(temp);
    }
    return NewsModel(
      idNews: json['idNews'],
      title: json['title'],
      text: json['text'],
      idNewsType: json['idNewsType'],
      dateCreated: DateTime.tryParse(json['dateCreated']),
      dateUpdated: DateTime.tryParse(json['dateUpdated']),
      idNewsType2: json['idNewsType2'] == null ? null: TypeNewsModel.fromJson(json['idNewsType2']),
      imageNewsTables: list,
    );
  }
}