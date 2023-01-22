
import 'package:redux/redux.dart';
import 'package:vet_pass/Model/ClientModel.dart';
import 'ProfilePageAction.dart';

Reducer<int> isLoadingProfilePageReducer = combineReducers([
  TypedReducer<int, IsLoadAction>(_isLoad),
  TypedReducer<int, IsLoadedAction>(_isLoaded),
]);

int _isLoad(int value, IsLoadAction action) => 0;
int _isLoaded(int value, IsLoadedAction action) => 1;

Reducer<ClientModel> clientReducer = combineReducers([
  TypedReducer<ClientModel, SetClientAction>(_getClient),
  TypedReducer<ClientModel, SetPasswordAction>(_setPassword),
  TypedReducer<ClientModel, SetPhoneAction>(_setPhone),
  TypedReducer<ClientModel, SetEmailAction>(_setEmail),
]);

ClientModel _getClient(ClientModel value, SetClientAction action) => action.client;

ClientModel _setPassword(ClientModel value, SetPasswordAction action) {
  ClientModel clientModel = ClientModel(
    idClient: value.idClient,
    fio: value.fio,
    phone:  value.phone,
    email: value.email,
    comment: value.comment,
    login: value.login,
    password: action.password,
  );
  value = clientModel;
  return value;
}

ClientModel _setPhone(ClientModel value, SetPhoneAction action) {
  ClientModel clientModel = ClientModel(
    idClient: value.idClient,
    fio: value.fio,
    phone:  action.phone,
    email: value.email,
    comment: value.comment,
    login: value.login,
    password: value.password,
  );
  value = clientModel;
  return value;
}

ClientModel _setEmail(ClientModel value, SetEmailAction action) {
  ClientModel clientModel = ClientModel(
    idClient: value.idClient,
    fio: value.fio,
    phone:  value.phone,
    email: action.email,
    comment: value.comment,
    login: value.login,
    password: value.password,
  );
  value = clientModel;
  return value;
}

Reducer<String> textModalReducer = combineReducers([
  TypedReducer<String, SetModalTextAction>(_setModalText),
]);

String _setModalText(String text, SetModalTextAction action)  {
  return action.text;
}