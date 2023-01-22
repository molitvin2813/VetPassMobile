import 'package:redux/redux.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/AnimalTypeModel.dart';

import 'AddAnimalPageActions.dart';


Reducer<AnimalTypeModel> addAnimalTypeCurrReducer = combineReducers([
  TypedReducer<AnimalTypeModel, SetAnimalTypeCurrAction>(_setAnimalTypeCurState),
]);

AnimalTypeModel _setAnimalTypeCurState(AnimalTypeModel value, SetAnimalTypeCurrAction action) {
  return action.animalTypeModel;
}

Reducer<List<AnimalTypeModel>> addAnimalTypeListReducer = combineReducers([
  TypedReducer<List<AnimalTypeModel>, ResetAnimalTypeListAction>(_resetAnimalTypeListState),
  TypedReducer<List<AnimalTypeModel>, SetAnimalTypeListAction>(_setAnimalTypeListState),
]);

List<AnimalTypeModel> _resetAnimalTypeListState(List<AnimalTypeModel> value, ResetAnimalTypeListAction action) =>
    const <AnimalTypeModel>[];

List<AnimalTypeModel> _setAnimalTypeListState(List<AnimalTypeModel> value, SetAnimalTypeListAction action) {
  return action.animalTypes;
}

Reducer<AnimalModel> addAnimalReducer = combineReducers([
  TypedReducer<AnimalModel, ResetAnimalAction>(_resetAnimalState),
  TypedReducer<AnimalModel, SetAnimalAction>(_setAnimalState),
  TypedReducer<AnimalModel, SetAnimalNameAction>(_setAnimalName),
  TypedReducer<AnimalModel, SetAnimalGenderAction>(_setAnimalGender),
  TypedReducer<AnimalModel, SetAnimalIsCastratedAction>(_setAnimalIsCastrated),
  TypedReducer<AnimalModel, SetAnimalWeightAction>(_setAnimalWeight),
  TypedReducer<AnimalModel, SetAnimalAgeAction>(_setAnimalAge),
  TypedReducer<AnimalModel, SetAnimalTypeAction>(_setAnimalType),
  TypedReducer<AnimalModel, SetAnimalClientAction>(_setAnimalClient),
]);

AnimalModel _resetAnimalState(AnimalModel value, ResetAnimalAction action) =>
    const AnimalModel.initialState();

AnimalModel _setAnimalState(AnimalModel value, SetAnimalAction action) {
  return action.animal;
}

AnimalModel _setAnimalName(AnimalModel value, SetAnimalNameAction action) {
  value = AnimalModel(
      name: action.name,
      gender: value.gender,
      isCastrated: value.isCastrated,
      weight: value.weight,
      age: value.age,
      idClient: value.idClient,
      idType: value.idType);
  return value;
}

AnimalModel _setAnimalGender(AnimalModel value, SetAnimalGenderAction action) {
  value = AnimalModel(
      name: value.name,
      gender: action.gender,
      isCastrated: value.isCastrated,
      weight: value.weight,
      age: value.age,
      idClient: value.idClient,
      idType: value.idType);
  return value;
}

AnimalModel _setAnimalIsCastrated(
    AnimalModel value, SetAnimalIsCastratedAction action) {
  value = AnimalModel(
      name: value.name,
      gender: value.gender,
      isCastrated: action.isCastrated,
      weight: value.weight,
      age: value.age,
      idClient: value.idClient,
      idType: value.idType);
  return value;
}

AnimalModel _setAnimalWeight(AnimalModel value, SetAnimalWeightAction action) {
  value = AnimalModel(
      name: value.name,
      gender: value.gender,
      isCastrated: value.isCastrated,
      weight: action.weight,
      age: value.age,
      idClient: value.idClient,
      idType: value.idType);
  return value;
}

AnimalModel _setAnimalAge(AnimalModel value, SetAnimalAgeAction action) {
  value = AnimalModel(
      name: value.name,
      gender: value.gender,
      isCastrated: value.isCastrated,
      weight: value.weight,
      age: action.age,
      idClient: value.idClient,
      idType: value.idType);
  return value;
}

AnimalModel _setAnimalType(AnimalModel value, SetAnimalTypeAction action) {

  value = AnimalModel(
      name: value.name,
      gender: value.gender,
      isCastrated: value.isCastrated,
      weight: value.weight,
      age: value.age,
      idClient: value.idClient,
      idType: action.idType2.idType);
  return value;
}

AnimalModel _setAnimalClient(AnimalModel value, SetAnimalClientAction action) {
  value = AnimalModel(
      name: value.name,
      gender: value.gender,
      isCastrated: value.isCastrated,
      weight: value.weight,
      age: value.age,
      idType: value.idType2?.idType,
      idClient: action.id
  );
  return value;
}