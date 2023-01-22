import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/AnimalModel.dart';

@immutable
class MainPageState{
  //final List<AnimalModel> animalList;
  //final AnimalModel currentAnimal;
  final int indexNavBar;
  final int isLoading;
  final int countMessage;

  const MainPageState(
    {
      //required this.animalList,
      //required this.currentAnimal,
      required this.isLoading,
      required this.indexNavBar,
      required this.countMessage,
    }
  );

  const MainPageState.initialState()
      : //animalList = const <AnimalModel>[],
        //currentAnimal = const AnimalModel.initialState(),
        isLoading = 0,
        indexNavBar = 0,
        countMessage = 0;
}