import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/PrescriptionModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

class GettingAnimal{}
class GetAnimal {
  final AnimalModel animal;
  GetAnimal(this.animal);
}
class IsLoad{}
class IsLoaded{}


class GetPrescription {
  final List<PrescriptionModel> prescriptionModel;
  GetPrescription(this.prescriptionModel);
}

class ChangeAnimalImage{}

ThunkAction<AppState> getAnimalThunkAction = (Store store) async {
  store.dispatch(GettingAnimal());
  store.dispatch(IsLoad());
  _getAnimal(store.state).then((value){
    store.dispatch(GetAnimal(value));
    store.dispatch(IsLoaded());
  });
};

Future<AnimalModel> _getAnimal(AppState state) async{
  AnimalModel result = const AnimalModel.initialState();
  var client = http.Client();
  try {
    var response = await client.get(
        Uri.parse('${baseUrlApi}animal/${state.selectAnimalState.currentAnimal.idAnimal}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){

      var l = await jsonDecode(response.body);

      result = AnimalModel.fromJson(jsonDecode(response.body));
      print(result.name);
    }
  } finally {
    client.close();
  }
  return result;
}

ThunkAction<AppState> getPrescriptionThunkAction = (Store store) async {
  _getPrescription(store.state).then((value){
    store.dispatch(GetPrescription(value));
  });
};

Future<List<PrescriptionModel>> _getPrescription(AppState state) async{
  List<PrescriptionModel> result = const <PrescriptionModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
        Uri.parse('${baseUrlApi}prescription/animal/${state.selectAnimalState.currentAnimal.idAnimal}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){

      var l = await jsonDecode(response.body)?.map((model)=> PrescriptionModel.fromJson(model));

      result = List<PrescriptionModel>.from(l);
    }
  } finally {
    client.close();
  }
  return result;
}