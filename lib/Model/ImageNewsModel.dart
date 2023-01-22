import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';

@immutable
class ImageNewsModel {
  final int idImageNews;
  final String? name;
  final String? path;
  final NewsModel? idNews2;
  final int? idNews;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;

  const ImageNewsModel(
      {
        required this.idImageNews,
        this.idNews,
        this.name,
        this.path,
        this.idNews2,
        this.dateCreated,
        this.dateUpdated
      }
      );

  const ImageNewsModel.initialState()
      : idImageNews = -1,
        path = "",
        name = "",
        idNews = -1,
        idNews2 = const NewsModel.initialState(),
        dateCreated = null,
        dateUpdated = null;

  factory ImageNewsModel.fromJson(Map<String, dynamic> json) {

    return ImageNewsModel(
      idImageNews: json['idImageNews'],
      path: json['path'],
      name: json['name'],
      idNews: json['idNews'],
      idNews2: json['idNews2'] == null ? null : NewsModel.fromJson(json['idNews2']),
      dateCreated: DateTime.tryParse(json['dateCreated']),
      dateUpdated: DateTime.tryParse(json['dateUpdated']),

    );
  }
}