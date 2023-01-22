import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Model/ClientModel.dart';

@immutable
class ProfilePageState{
  final ClientModel client;
  final int isLoadingProfilePage;
  final String modalText;

  const ProfilePageState(
      {
        required this.client,
        required this.isLoadingProfilePage,
        required this.modalText,
      });

  const ProfilePageState.initialState()
      : client = const ClientModel.initialState(),
        isLoadingProfilePage = 0,
        modalText = '';
}