import 'package:redux/redux.dart';
import 'package:vet_pass/Model/ChatRoomModel.dart';
import '../../Model/ListUserChatModel.dart';
import 'ChatRoomPageAction.dart';

Reducer<List<ListUserChatModel>>  listChatRoomReducer = combineReducers([
  TypedReducer<List<ListUserChatModel>, ChangeChatRoomListAction>(_changeChatRoom),
  TypedReducer<List<ListUserChatModel>, ClearChatRoomListAction>(_clearChatRoom),
]);

List<ListUserChatModel> _changeChatRoom(List<ListUserChatModel> value, ChangeChatRoomListAction action) => action.listChatRoom;
List<ListUserChatModel> _clearChatRoom(List<ListUserChatModel> value, ClearChatRoomListAction action) => const <ListUserChatModel>[];

Reducer<int> isLoadingChatRoomReducer = combineReducers([
  TypedReducer<int, IsLoad>(_isLoad),
  TypedReducer<int, IsLoaded>(_isLoaded),
]);

int _isLoad(int value, IsLoad action) => 0;
int _isLoaded(int value, IsLoaded action) => 1;

Reducer<ListUserChatModel> currentChatRoomReducer = combineReducers([
  TypedReducer<ListUserChatModel, ChangeCurrentChatRoomAction>(_changeCurrentChatRoom),
  TypedReducer<ListUserChatModel, ClearCurrentChatRoomAction>(_clearCurrentChatRoom),
]);

ListUserChatModel _changeCurrentChatRoom(ListUserChatModel value, ChangeCurrentChatRoomAction action) => action.chatRoomModel;
ListUserChatModel _clearCurrentChatRoom(ListUserChatModel value, ClearCurrentChatRoomAction action) => const ListUserChatModel.initialState();



Reducer<List<DateTime>> lastDateMessageListReducer = combineReducers([
  TypedReducer<List<DateTime>, ChangeLastDateMessageList>(_changeLastDateMessageList),
  TypedReducer<List<DateTime>, ClearLastDateMessageList>(_clearLastDateMessageList),
]);

List<DateTime> _changeLastDateMessageList(List<DateTime> value, ChangeLastDateMessageList action) => action.lastDateMessageList;
List<DateTime> _clearLastDateMessageList(List<DateTime> value, ClearLastDateMessageList action) => const <DateTime>[];