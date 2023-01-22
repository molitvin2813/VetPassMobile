import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_pass/Model/ChatMessageModel.dart';
import 'package:vet_pass/Model/ChatRoomModel.dart';
import 'package:vet_pass/Model/DoctorModel.dart';

@immutable
class ChatMessagePageState {
  final List<ChatMessageModel> chatMessage;
  final bool isLoadingChatMessagePage;
  final int isAllLoadMessagePage;
  final int page;
  final List<XFile> imageFileList;

  const ChatMessagePageState({
    required this.chatMessage,
    required this.isLoadingChatMessagePage,
    required this.isAllLoadMessagePage,
    required this.imageFileList,
    required this.page,
  });

  const ChatMessagePageState.initialState()
      : chatMessage = const <ChatMessageModel>[],
        isLoadingChatMessagePage = false,
        isAllLoadMessagePage = 0,
        imageFileList = const <XFile>[],
        page = 0;
}
