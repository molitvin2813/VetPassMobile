import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Model/ChatMessageModel.dart';
import 'ChatMessagePageAction.dart';

Reducer<List<ChatMessageModel>> listChatMessageReducer = combineReducers([
  TypedReducer<List<ChatMessageModel>, ChangeChatMessageListAction>(_changeChatMessage),
  TypedReducer<List<ChatMessageModel>, ClearChatMessageListAction>(_clearChatMessage),
  TypedReducer<List<ChatMessageModel>, AddChatMessageAction>(_addChatMessage),
  TypedReducer<List<ChatMessageModel>, AddAllChatMessageAction>(_addAllChatMessage),

]);

List<ChatMessageModel> _changeChatMessage(List<ChatMessageModel> value, ChangeChatMessageListAction action) => action.listMessage;

List<ChatMessageModel> _clearChatMessage(List<ChatMessageModel> value, ClearChatMessageListAction action) => const <ChatMessageModel>[];

List<ChatMessageModel> _addChatMessage(List<ChatMessageModel> value, AddChatMessageAction action) {
  value.add(action.chatMessageModel);
  return value;
}

List<ChatMessageModel> _addAllChatMessage(List<ChatMessageModel> value, AddAllChatMessageAction action) {
  value.addAll(action.listMessage);
  return value;
}


Reducer<bool> isLoadingChatMessageReducer = combineReducers([
  TypedReducer<bool, IsLoad>(_isLoad),
  TypedReducer<bool, IsLoaded>(_isLoaded),
]);

bool _isLoad(bool value, IsLoad action) {
  print('ebob2');
  return false;
}

bool _isLoaded(bool value, IsLoaded action)  {
  print('ebob');
  return  true;
}

Reducer<int> isAllLoadedChatMessageReducer = combineReducers([
  TypedReducer<int, IsAllLoad>(_isAllLoad),
  TypedReducer<int, IsAllLoaded>(_isAllLoaded),
]);

int _isAllLoad(int value, IsAllLoad action) => 0;
int _isAllLoaded(int value, IsAllLoaded action) => 1;


Reducer<List<XFile>> listFileReducer = combineReducers([
  TypedReducer<List<XFile>, SetListFile>(_setListFile),
]);

List<XFile> _setListFile(List<XFile> value, SetListFile action) => action.imageFileList;


Reducer<int> messagePageReducer = combineReducers([
  TypedReducer<int, NextMessagePage>(_nextMessagePage),
  TypedReducer<int, ClearMessagePage>(_clearMessagePage),
]);

int _nextMessagePage(int value, NextMessagePage action) => value + 1;
int _clearMessagePage(int value, ClearMessagePage action) => 0;