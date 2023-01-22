import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/AnimalTypeModel.dart';

@immutable
class AddAnimalPageState {
  final AnimalModel animal;
  final List<AnimalTypeModel> animalType;
  final AnimalTypeModel currAnimalType;

  const AddAnimalPageState({
    required this.animal,
    required this.animalType,
    required this.currAnimalType,
  });

  const AddAnimalPageState.initialState()
      : animal = const AnimalModel.initialState(),
        currAnimalType = const AnimalTypeModel.initialState(),
        animalType = const <AnimalTypeModel>[];
}
