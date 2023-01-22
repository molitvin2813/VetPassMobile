import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/ClientModel.dart';

@immutable
class RegistrationState {
  final ClientModel client;
  final int isRegistered;

  const RegistrationState(
      {required this.client, required this.isRegistered});

  const RegistrationState.initialState()
      : client = const ClientModel.initialState(),
        isRegistered = 0;
}
