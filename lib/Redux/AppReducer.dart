import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalPageReducer.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalState.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageState.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/CalendarPage/CalendarPageState.dart';
import 'package:vet_pass/Redux/ChatMessagePage/ChatMessagePageState.dart';
import 'package:vet_pass/Redux/ChatRoomPage/ChatRoomPageReducer.dart';
import 'package:vet_pass/Redux/ChatRoomPage/ChatRoomPageState.dart';
import 'package:vet_pass/Redux/MainPage/MainPageState.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageState.dart';
import 'package:vet_pass/Redux/PrescriptionsListPage/PrescriptionPageReducer.dart';
import 'package:vet_pass/Redux/PrescriptionsListPage/PrescriptionPageState.dart';
import 'package:vet_pass/Redux/ProfilePage/ProfilePageState.dart';
import 'package:vet_pass/Redux/RegistrationPage/RegistrationReducer.dart';
import 'package:vet_pass/Redux/RegistrationPage/RegistrationState.dart';

import 'AnimalPage/AnimalPageReducer.dart';
import 'CalendarPage/CalendarPageReducer.dart';
import 'ChatMessagePage/ChatMessagePageRudecer.dart';
import 'LoginPage/LoginReducer.dart';
import 'LoginPage/LoginState.dart';
import 'MainPage/MainPageReducer.dart';
import 'NewsPage/NewsPageReducer.dart';
import 'ProfilePage/ProfilePageReducer.dart';
import 'SelectAnimalPage/SelectAnimalReducer.dart';
import 'SelectAnimalPage/SelectAnimalState.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    loginState: LoginState(
      login: loginReducer(state.loginState.login, action),
      password: passwordReducer(state.loginState.password, action),
      isLogged: isLoggedReducer(state.loginState.isLogged, action),
    ),
    selectAnimalState: SelectAnimalState(
      animalList: listAnimalReducer(state.selectAnimalState.animalList, action),
      currentAnimal:
          currentAnimalReducer(state.selectAnimalState.currentAnimal, action),
      isLoading: isLoadingReducer(state.selectAnimalState.isLoading, action),
    ),
    mainPageState: MainPageState(
      isLoading: isLoadingNewsReducer(state.mainPageState.isLoading, action),
      indexNavBar: indexNavBarReducer(state.mainPageState.indexNavBar, action),
      countMessage:
          countMessageReducer(state.mainPageState.countMessage, action),
    ),
    animalPageState: AnimalPageState(
        isLoading:
            isLoadingAnimalReducer(state.animalPageState.isLoading, action),
        animal: animalReducer(state.animalPageState.animal, action),
        animalImage:
            animalImageReducer(state.animalPageState.animalImage, action),
        prescriptionModel: prescriptionReducer(
            state.animalPageState.prescriptionModel, action)),
    calendarPageState: CalendarPageState(
      isLoadingCalendarPage: isLoadingCalendarPage(
          state.calendarPageState.isLoadingCalendarPage, action),
      visit: visitCalendarPageReducer(state.calendarPageState.visit, action),
      markedDateMap:
          markedDateMapReducer(state.calendarPageState.markedDateMap, action),
      selectedEvents:
          selectedEventsReducer(state.calendarPageState.selectedEvents, action),
      selectedDay:
          daySelectedReducer(state.calendarPageState.selectedDay, action),
      rangeEnd: rangeEndReducer(state.calendarPageState.rangeEnd, action),
      rangeStart: rangeStartReducer(state.calendarPageState.rangeStart, action),
      rangeSelectionMode: rangeSelectionModeReducer(
          state.calendarPageState.rangeSelectionMode, action),
      calendarFormat:
          calendarFormatReducer(state.calendarPageState.calendarFormat, action),
      focusedDay: focusedDayReducer(state.calendarPageState.focusedDay, action),
      currentVisit:
          currentVisitReducer(state.calendarPageState.currentVisit, action),
    ),
    newsPageState: NewsPageState(
      isLoadingNewsPage: isLoadingNewsPageReducer(
          state.newsPageState.isLoadingNewsPage, action),
      allLoadedNewsPage: isAllLoadingNewsPageReducer(
          state.newsPageState.allLoadedNewsPage, action),
      newsList: listNewsReducer(state.newsPageState.newsList, action),
      pageNumber: pagesReducer(state.newsPageState.pageNumber, action),
      typeList: typeListReducer(state.newsPageState.typeList, action),
      currentTypeID:
          newsTypeIDReducer(state.newsPageState.currentTypeID, action),
    ),
    profilePageState: ProfilePageState(
      isLoadingProfilePage: isLoadingProfilePageReducer(
          state.profilePageState.isLoadingProfilePage, action),
      client: clientReducer(state.profilePageState.client, action),
      modalText: textModalReducer(state.profilePageState.modalText, action),
    ),
    chatRoomPageState: ChatRoomPageState(
        chatRoomList:
            listChatRoomReducer(state.chatRoomPageState.chatRoomList, action),
        currentChatRoom: currentChatRoomReducer(
            state.chatRoomPageState.currentChatRoom, action),
        isLoadingChatRoomPage: isLoadingChatRoomReducer(
            state.chatRoomPageState.isLoadingChatRoomPage, action),
        lastDateMessageList: lastDateMessageListReducer(
            state.chatRoomPageState.lastDateMessageList, action)),
    chatMessagePageState: ChatMessagePageState(
      chatMessage: listChatMessageReducer(
          state.chatMessagePageState.chatMessage, action),
      isLoadingChatMessagePage: isLoadingChatMessageReducer(
          state.chatMessagePageState.isLoadingChatMessagePage, action),
      isAllLoadMessagePage: isAllLoadedChatMessageReducer(
          state.chatMessagePageState.isAllLoadMessagePage, action),
      imageFileList:
          listFileReducer(state.chatMessagePageState.imageFileList, action),
      page: messagePageReducer(state.chatMessagePageState.page, action),
    ),
    registrationState: RegistrationState(
        isRegistered:
            isRegisterReducer(state.registrationState.isRegistered, action),
        client:
            clientRegistrationReducer(state.registrationState.client, action)),
    addAnimalPageState: AddAnimalPageState(
      animal: addAnimalReducer(state.addAnimalPageState.animal, action),
      animalType:
          addAnimalTypeListReducer(state.addAnimalPageState.animalType, action),
      currAnimalType: addAnimalTypeCurrReducer(
          state.addAnimalPageState.currAnimalType, action),
    ),
    prescriptionPageState: PrescriptionPageState(
      prescriptionModel: listPrescriptionPageReducer(
          state.prescriptionPageState.prescriptionModel, action),
      isLoadingPrescriptionPage: isLoadingPrescriptionPageReducer(
          state.prescriptionPageState.isLoadingPrescriptionPage, action),
    ));
