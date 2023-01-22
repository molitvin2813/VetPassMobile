import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/MainPage/MainPageActions.dart';

Reducer<int> isLoadingNewsReducer = combineReducers([
  TypedReducer<int, GettingNews>(_isLoad),
  TypedReducer<int, GetNews>(_isLoaded),
]);

int _isLoad(int value, GettingNews action) => 0;
int _isLoaded(int value, GetNews action) => 1;

Reducer<int> indexNavBarReducer = combineReducers([
  TypedReducer<int, ChangeNavBarIndex>(_changeNavBarIndex),
]);

int _changeNavBarIndex(int value, ChangeNavBarIndex action) => action.newIndex;


Reducer<int>  countMessageReducer = combineReducers([
  TypedReducer<int, ChangeCountMessage>(_changeCountMessage),
  TypedReducer<int, ClearCountMessage>(_clearCountMessage),
]);

int _clearCountMessage(int value, ClearCountMessage action) => 0;
int _changeCountMessage(int value, ChangeCountMessage action) {
  return  action.count;
}