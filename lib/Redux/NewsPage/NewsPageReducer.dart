import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Model/NewsModel.dart';
import 'package:vet_pass/Model/TypeNewsModel.dart';


import '../../Model/AnimalModel.dart';
import 'NewsPageAction.dart';

Reducer<List<NewsModel>>  listNewsReducer = combineReducers([
  TypedReducer<List<NewsModel>, GetListNewsAction>(_getListNews),
  TypedReducer<List<NewsModel>, GetNextListNewsAction>(_getNextListNews),
  TypedReducer<List<NewsModel>, ClearListNewsAction>(_clearListNews),
  TypedReducer<List<NewsModel>, GetNewsByTypeAction>(_getNewsByCategory),
]);

List<NewsModel> _getListNews(List<NewsModel> value, GetListNewsAction action) => action.listNews;
List<NewsModel> _clearListNews(List<NewsModel> value, ClearListNewsAction action) => List.unmodifiable(<NewsModel>[]);
List<NewsModel> _getNewsByCategory(List<NewsModel> value, GetNewsByTypeAction action) => action.listNews;
List<NewsModel> _getNextListNews(List<NewsModel> value, GetNextListNewsAction action) {
  value.addAll(action.listNews);
  return  value;
}

Reducer<List<TypeNewsModel>>  typeListReducer = combineReducers([
  TypedReducer<List<TypeNewsModel>, GetTypeListAction>(_getTypeList),
]);

List<TypeNewsModel> _getTypeList(List<TypeNewsModel> value, GetTypeListAction action) => action.typeList;


Reducer<int> isLoadingNewsPageReducer = combineReducers([
  TypedReducer<int, IsLoadAction>(_isLoad),
  TypedReducer<int, IsLoadedAction>(_isLoaded),
]);

int _isLoad(int value, IsLoadAction action) => 0;
int _isLoaded(int value, IsLoadedAction action) => 1;

Reducer<int> newsTypeIDReducer = combineReducers([
  TypedReducer<int, ChangeCurrentTypeIDAction>(_changeCurrentTypeID),
  TypedReducer<int, ClearCurrentTypeIDAction>(_clearCurrentType),
]);

int _changeCurrentTypeID(int value, ChangeCurrentTypeIDAction action) => action.typeID;
int _clearCurrentType(int value, ClearCurrentTypeIDAction action) => -1;

Reducer<int> isAllLoadingNewsPageReducer = combineReducers([
  TypedReducer<int, IsAllLoadAction>(_isAllLoad),
  TypedReducer<int, IsAllLoadedAction>(_isAllLoaded),
]);

int _isAllLoad(int value, IsAllLoadAction action) => 0;
int _isAllLoaded(int value, IsAllLoadedAction action) => 1;


Reducer<int> pagesReducer = combineReducers([
  TypedReducer<int, NextPageAction>(_nextPage),
  TypedReducer<int, PrevPageAction>(_prevPage),
  TypedReducer<int, ClearPageAction> (_clearPage),
]);

int _nextPage(int value, NextPageAction action) => ++value;
int _prevPage(int value, PrevPageAction action) => --value;
int _clearPage(int value, ClearPageAction action) => 0;
