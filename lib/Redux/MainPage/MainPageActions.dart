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

import '../AnimalPage/AnimalPageAction.dart';

class GettingNews{}
class GetNews {
  final List<AnimalModel> listAnimal;
  GetNews(this.listAnimal);
}
class IsLoad{}
class IsLoaded{}

class UpdatingNews{}
class UpdateNews{
  final List<AnimalModel> listAnimal;
  UpdateNews(this.listAnimal);
}

class ClearNews{}

class ChangeNavBarIndex{
  final int newIndex;
  ChangeNavBarIndex(this.newIndex);
}

class ChangeCountMessage{
  final int count;
  ChangeCountMessage(this.count);
}
class ClearCountMessage{}


ThunkAction<AppState> getCountMessageThunkAction = (Store store) async {
  _getCountMessage(store.state).then((value) => store.dispatch(ChangeCountMessage(value)));
};

Future<int> _getCountMessage(AppState state) async{
  int result = 0;
  var client = http.Client();
  try {
    var response = await client.get(
        Uri.parse('${baseUrlApi}list-user-chat-table/count/$idClient'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){
      result = jsonDecode(response.body);
      print(result);
    }
  } finally {
    client.close();
  }
  return result;
}


ThunkAction<AppState> navigateMainPageThunkAction = (Store store) async{
  store.dispatch(NavigateToAction.push(
      "/animal",
      preNavigation: (){
        store.dispatch(getAnimalThunkAction(store as Store<AppState>));
        store.dispatch(getPrescriptionThunkAction(store));

        store.dispatch(ChangeAnimalImage());
      }
    )
  );
};
