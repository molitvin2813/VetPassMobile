import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import '../NewsPage/NewsPageAction.dart';

class GettingAnimal{}
class GetListAnimal {
  final List<AnimalModel> listAnimal;
  GetListAnimal(this.listAnimal);
}
class IsLoad{}
class IsLoaded{}

class UpdatingAnimal{}
class UpdateListAnimal{
  final List<AnimalModel> listAnimal;
  UpdateListAnimal(this.listAnimal);
}

class ClearListAnimal{}

class DeleteAnimalAction{
  final AnimalModel animalModel;
  DeleteAnimalAction(this.animalModel);
}

class ChangeCurrentAnimal{
  final AnimalModel currentAnimal;
  ChangeCurrentAnimal(this.currentAnimal);
}


ThunkAction<AppState> deleteAnimalThunkAction = (Store store) async {
  _deleteAnimal(store.state).then((value) {
    store.dispatch(DeleteAnimalAction(value));
  });
};

Future<AnimalModel> _deleteAnimal(AppState state) async{
  AnimalModel result = const AnimalModel.initialState();
  var client = http.Client();
  try {
    var response = await client.delete(
        Uri.parse('${baseUrlApi}animal/${state.selectAnimalState.currentAnimal.idAnimal}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );

    if(response.statusCode == 200){
      result = state.selectAnimalState.currentAnimal;
    }
  } finally {
    client.close();
  }
  return result;
}

ThunkAction<AppState> navigateThunkAction = (Store store) async{
  store.dispatch(NavigateToAction.push("/main", postNavigation: (){
    store.dispatch(getNewsListThunkAction(store as Store<AppState>));
    store.dispatch(getTypeListThunkAction(store));
  }));
};

ThunkAction<AppState> getAnimalListThunkAction = (Store store) async {
  store.dispatch(GettingAnimal());
  store.dispatch(IsLoad());
  _getAnimalList(store.state).then((value){
    store.dispatch(GetListAnimal(value));
    print('eeeeee');
    store.dispatch(IsLoaded());
  });
};

Future<List<AnimalModel>> _getAnimalList(AppState state) async{
  List<AnimalModel> result = <AnimalModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
      Uri.parse('${baseUrlApi}animal/client/$idClient'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader : 'Bearer $token',
      }
    );

    if(response.statusCode == 200){
      Iterable l = jsonDecode(response.body);
      List<AnimalModel> posts = List<AnimalModel>.from(l.map((model)=> AnimalModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}

ThunkAction<AppState> updateAnimalListThunkAction = (Store store) async {
  store.dispatch(UpdatingAnimal());
};