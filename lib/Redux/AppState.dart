import 'package:flutter/cupertino.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalState.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageState.dart';
import 'package:vet_pass/Redux/CalendarPage/CalendarPageState.dart';
import 'package:vet_pass/Redux/ChatMessagePage/ChatMessagePageState.dart';
import 'package:vet_pass/Redux/ChatRoomPage/ChatRoomPageState.dart';
import 'package:vet_pass/Redux/MainPage/MainPageState.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageState.dart';
import 'package:vet_pass/Redux/PrescriptionsListPage/PrescriptionPageState.dart';
import 'package:vet_pass/Redux/ProfilePage/ProfilePageState.dart';

import 'LoginPage/LoginState.dart';
import 'RegistrationPage/RegistrationState.dart';
import 'SelectAnimalPage/SelectAnimalState.dart';

@immutable
class AppState {
  final LoginState loginState;
  final SelectAnimalState selectAnimalState;
  final MainPageState mainPageState;
  final AnimalPageState animalPageState;
  final CalendarPageState calendarPageState;
  final NewsPageState newsPageState;
  final ProfilePageState profilePageState;
  final ChatRoomPageState chatRoomPageState;
  final ChatMessagePageState chatMessagePageState;
  final RegistrationState registrationState;
  final AddAnimalPageState addAnimalPageState;
  final PrescriptionPageState prescriptionPageState;

  const AppState(
      {required this.loginState,
      required this.selectAnimalState,
      required this.mainPageState,
      required this.animalPageState,
      required this.calendarPageState,
      required this.newsPageState,
      required this.profilePageState,
      required this.chatRoomPageState,
      required this.chatMessagePageState,
      required this.registrationState,
      required this.addAnimalPageState,
      required this.prescriptionPageState});

  const AppState.initialState()
      : loginState = const LoginState.initialState(),
        selectAnimalState = const SelectAnimalState.initialState(),
        mainPageState = const MainPageState.initialState(),
        animalPageState = const AnimalPageState.initialState(),
        calendarPageState = const CalendarPageState.initialState(),
        newsPageState = const NewsPageState.initialState(),
        profilePageState = const ProfilePageState.initialState(),
        chatRoomPageState = const ChatRoomPageState.initialState(),
        chatMessagePageState = const ChatMessagePageState.initialState(),
        registrationState = const RegistrationState.initialState(),
        addAnimalPageState = const AddAnimalPageState.initialState(),
        prescriptionPageState = const PrescriptionPageState.initialState();
}
