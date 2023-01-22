import 'dart:convert';
import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import 'package:vet_pass/Model/AnimalModel.dart';

import '../../Model/AnimalTypeModel.dart';
import '../SelectAnimalPage/SelectAnimalActions.dart';

class SetAnimalAction {
  final AnimalModel animal;

  SetAnimalAction(this.animal);
}

class SetAnimalNameAction {
  final String name;

  SetAnimalNameAction(this.name);
}

class SetAnimalClientAction{
  final int id;
  SetAnimalClientAction(this.id);
}

class SetAnimalGenderAction {
  final String gender;

  SetAnimalGenderAction(this.gender);
}

class SetAnimalIsCastratedAction {
  final int isCastrated;

  SetAnimalIsCastratedAction(this.isCastrated);
}

class SetAnimalWeightAction {
  final double weight;

  SetAnimalWeightAction(this.weight);
}

class SetAnimalAgeAction {
  final int age;

  SetAnimalAgeAction(this.age);
}

class SetAnimalTypeAction {
  final AnimalTypeModel idType2;

  SetAnimalTypeAction(this.idType2);
}

class ResetAnimalAction {}

class SetAnimalTypeListAction {
  final List<AnimalTypeModel> animalTypes;

  SetAnimalTypeListAction(this.animalTypes);
}

class ResetAnimalTypeListAction {}

class SetAnimalTypeCurrAction {
  final AnimalTypeModel animalTypeModel;

  SetAnimalTypeCurrAction(this.animalTypeModel);
}

ThunkAction<AppState> getAnimalTypeListThunkAction = (Store store) async {
  await _getAnimalTypeList(store.state, store).then((value) {
    store.dispatch(SetAnimalTypeListAction(value));
    store.dispatch(SetAnimalTypeCurrAction(value[0]));
    store.dispatch(SetAnimalTypeAction(value[0]));
  });
};

Future<List<AnimalTypeModel>> _getAnimalTypeList(
    AppState state, Store store) async {
  List<AnimalTypeModel> result = <AnimalTypeModel>[];
  var client = http.Client();
  try {
    var response = await http.get(
      Uri.parse('${baseUrlApi}animal-type/'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader : 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var l = await jsonDecode(response.body)
          ?.map((model) => AnimalTypeModel.fromJson(model));
      result = List<AnimalTypeModel>.from(l);
    }
  } finally {
    client.close();
  }
  return result;
}

ThunkAction<AppState> registerAnimalThunkAction = (Store store) async {
  _register(store.state, store);
};

Future<int> _register(AppState state, Store store) async {

  int result = 0;
  var client = http.Client();
  try {
    var response = await http.post(
      Uri.parse('${baseUrlApi}animal/'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader : 'Bearer $token',
      },
      body: jsonEncode(state.addAnimalPageState.animal.toJson()),
    );
    if (response.statusCode != 401) {
      store.dispatch(NavigateToAction.pop(
        preNavigation: () {
          store.dispatch(getAnimalListThunkAction(store as Store<AppState>));
        }
      ));
    }
  } finally {
    client.close();
  }
  return result;
}
