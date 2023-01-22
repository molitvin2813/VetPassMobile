import 'dart:convert';
import 'dart:io';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';


class SetModalTextAction {
  final String text;
  SetModalTextAction(this.text);
}

class SetClientAction {
  final ClientModel client;
  SetClientAction(this.client);
}
class SetPasswordAction {
  final String password;
  SetPasswordAction(this.password);
}
class SetEmailAction {
  final String email;
  SetEmailAction(this.email);
}
class SetPhoneAction {
  final String phone;
  SetPhoneAction(this.phone);
}
class ClearClientAction{}

class IsLoadAction{}
class IsLoadedAction{}


ThunkAction<AppState> changeClientThunkAction = (Store store) async {
  store.dispatch(IsLoadAction());
  _changeClient(store.state).then((value) {
    store.dispatch(IsLoadedAction());
  });
};

Future<void> _changeClient(AppState state) async{
  var client = http.Client();
  try {
    print(state.profilePageState.client.toJson());
    await client.put(
      Uri.parse('${baseUrlApi}client/$idClient'),
      headers: <String, String>{
        HttpHeaders.authorizationHeader : 'Bearer $token',
      },
      body: state.profilePageState.client.toJson()
    );

  } finally {
    client.close();
  }
  return;
}

ThunkAction<AppState> getClientThunkAction = (Store store) async {
  store.dispatch(IsLoadAction());
  _getClient(store.state).then((value) {
      store.dispatch(SetClientAction(value));
      store.dispatch(IsLoadedAction());
  });
};



Future<ClientModel> _getClient(AppState state) async{
  ClientModel result = const ClientModel.initialState();
  var client = http.Client();
  try {
    print(state.newsPageState.currentTypeID);
    var response = await client.get(
      Uri.parse('${baseUrlApi}client/$idClient'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader : 'Bearer $token',
      },
    );
    if(response.statusCode == 200){
      //Iterable l = jsonDecode(response.body);
      result = ClientModel.fromJson(jsonDecode(response.body));
    }
  } finally {
    client.close();
  }
  return result;
}