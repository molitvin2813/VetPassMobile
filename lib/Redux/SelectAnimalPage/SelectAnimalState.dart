import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

@immutable
class SelectAnimalState{
  final List<AnimalModel> animalList;
  final AnimalModel currentAnimal;
  final int isLoading;
  const SelectAnimalState({required this.animalList, required this.currentAnimal, required this.isLoading});

  const SelectAnimalState.initialState()
      : animalList = const <AnimalModel>[],
        currentAnimal = const AnimalModel.initialState(),
        isLoading = 0;
}