import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';

import '../../Model/TypeNewsModel.dart';

@immutable
class NewsPageState{
  final List<NewsModel> newsList;
  final List<TypeNewsModel> typeList;
  final int isLoadingNewsPage;
  final int allLoadedNewsPage;
  final int pageNumber;
  final int currentTypeID;

  const NewsPageState(
      {
        required this.newsList,
        required this.isLoadingNewsPage,
        required this.allLoadedNewsPage,
        required this.pageNumber,
        required this.typeList,
        required this.currentTypeID
      });

  const NewsPageState.initialState()
      : newsList = const <NewsModel>[],
        isLoadingNewsPage = 0,
        allLoadedNewsPage = 0,
        pageNumber = 0,
        typeList = const <TypeNewsModel>[],
        currentTypeID = -1;
}