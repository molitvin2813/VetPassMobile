import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


import '../../Model/AnimalModel.dart';
import 'SelectAnimalActions.dart';

Reducer<List<AnimalModel>>  listAnimalReducer = combineReducers([
  TypedReducer<List<AnimalModel>, GettingAnimal>(_gettingAnimal),
  TypedReducer<List<AnimalModel>, GetListAnimal>(_getAnimal),
  TypedReducer<List<AnimalModel>, DeleteAnimalAction>(_deleteAnimal),
]);

List<AnimalModel> _gettingAnimal(List<AnimalModel> value, GettingAnimal action) => value;

List<AnimalModel> _getAnimal(List<AnimalModel> value, GetListAnimal action) {
  value = action.listAnimal;
  return  action.listAnimal;
}

List<AnimalModel> _deleteAnimal(List<AnimalModel> value, DeleteAnimalAction action) {
  value.remove(action.animalModel);
  return value;
}

Reducer<int> isLoadingReducer = combineReducers([
  TypedReducer<int, IsLoad>(_isLoad),
  TypedReducer<int, IsLoaded>(_isLoaded),
]);

int _isLoad(int value, IsLoad action) => 0;
int _isLoaded(int value, IsLoaded action) => 1;

Reducer<AnimalModel> currentAnimalReducer = combineReducers([
  TypedReducer<AnimalModel, ChangeCurrentAnimal>(_changeCurrentAnimal)
]);

AnimalModel _changeCurrentAnimal(AnimalModel value, ChangeCurrentAnimal action) => action.currentAnimal;
