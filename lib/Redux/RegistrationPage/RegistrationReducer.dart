
import 'package:redux/redux.dart';
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Redux/RegistrationPage/RegistrationActions.dart';


Reducer<int> isRegisterReducer = combineReducers([
  TypedReducer<int, RegisterResetAction>(_resetRegisterState),
  TypedReducer<int, RegisteredAction>(_setRegisterState),
]);

int _resetRegisterState(int value, RegisterResetAction action) => 0;
int _setRegisterState(int value, RegisteredAction action) {
  return action.isRegistered;
}

Reducer<ClientModel> clientRegistrationReducer = combineReducers([
  TypedReducer<ClientModel, ResetClientAction>(_resetClientState),
  TypedReducer<ClientModel, SetClientAction>(_setClientState),
  TypedReducer<ClientModel, SetClientEmailAction>(_setClientEmailState),
  TypedReducer<ClientModel, SetClientFIOAction>(_setClientFIOState),
  TypedReducer<ClientModel, SetClientLoginAction>(_setClientLoginState),
  TypedReducer<ClientModel, SetClientPasswordAction>(_setClientPasswordState),
  TypedReducer<ClientModel, SetClientPhoneAction>(_setClientPhoneState),
]);

ClientModel _resetClientState(ClientModel value, ResetClientAction action) => const ClientModel.initialState();

ClientModel _setClientState(ClientModel value, SetClientAction action) {
  return action.client;
}

ClientModel _setClientEmailState(ClientModel value, SetClientEmailAction action) {
  value = ClientModel(
    fio:  value.fio,
    email: action.email,
    login: value.login,
    password: value.password,
    phone: value.phone,
  );
  return value;
}

ClientModel _setClientFIOState(ClientModel value, SetClientFIOAction action) {
  value = ClientModel(
    fio:  action.fio,
    email: value.email,
    login: value.login,
    password: value.password,
    phone: value.phone,
  );
  return value;
}

ClientModel _setClientLoginState(ClientModel value, SetClientLoginAction action) {
  value = ClientModel(
    fio:  value.fio,
    email: value.email,
    login: action.login,
    password: value.password,
    phone: value.phone,
  );
  return value;
}

ClientModel _setClientPasswordState(ClientModel value, SetClientPasswordAction action) {
  value = ClientModel(
    fio:  value.fio,
    email: value.email,
    login: value.login,
    password: action.password,
    phone: value.phone,
  );
  return value;
}

ClientModel _setClientPhoneState(ClientModel value, SetClientPhoneAction action) {
  value = ClientModel(
    fio:  value.fio,
    email: value.email,
    login: value.login,
    password: value.password,
    phone: action.phone,
  );
  return value;
}