import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/PrescriptionModel.dart';
import 'package:vet_pass/Model/SupportModel/AnimalImage.dart';

@immutable
class AnimalPageState{

  final AnimalModel animal;
  final AnimalImage animalImage;
  final List<PrescriptionModel> prescriptionModel;
  final int isLoading;
  const AnimalPageState(
      {
        //required this.animalList,
        required this.animal,
        required this.animalImage,
        required this.isLoading,
        required this.prescriptionModel,
      }
      );

  const AnimalPageState.initialState()
      : animal = const AnimalModel.initialState(),
        animalImage = const AnimalImage.initialState(),
        prescriptionModel = const <PrescriptionModel>[],
        isLoading = 0;
}