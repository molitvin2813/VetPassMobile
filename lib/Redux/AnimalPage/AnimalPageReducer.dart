import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Model/PrescriptionModel.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageAction.dart';

import 'package:vet_pass/Variables/Constants.dart';
import 'dart:math';
import '../../Model/AnimalModel.dart';
import '../../Model/SupportModel/AnimalImage.dart';


Reducer<AnimalModel>  animalReducer = combineReducers([
  TypedReducer<AnimalModel, GettingAnimal>(_gettingAnimal),
  TypedReducer<AnimalModel, GetAnimal>(_getAnimal),
]);

AnimalModel _gettingAnimal(AnimalModel value, GettingAnimal action) => value;
AnimalModel _getAnimal(AnimalModel value, GetAnimal action) {
  return  action.animal;
}

Reducer<int> isLoadingAnimalReducer = combineReducers([
  TypedReducer<int, IsLoad>(_isLoad),
  TypedReducer<int, IsLoaded>(_isLoaded),
]);

int _isLoad(int value, IsLoad action) => 0;
int _isLoaded(int value, IsLoaded action) => 1;

Reducer<AnimalImage> animalImageReducer = combineReducers([
  TypedReducer<AnimalImage, ChangeAnimalImage>(_getRandomAnimalImage),
]);

AnimalImage _getRandomAnimalImage(AnimalImage value, ChangeAnimalImage action ) => animalImageList[Random().nextInt(animalImageList.length)];


Reducer<List<PrescriptionModel>>  prescriptionReducer = combineReducers([
  TypedReducer<List<PrescriptionModel>, GetPrescription>(_getPrescription),
]);

List<PrescriptionModel> _getPrescription(List<PrescriptionModel> value, GetPrescription action) {
  return  action.prescriptionModel;
}

