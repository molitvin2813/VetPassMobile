import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vet_pass/Pages/ChatMessagePage/Widget/UserModal.dart';

import 'package:vet_pass/Redux/ChatMessagePage/ChatMessagePageState.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../../Model/ChatMessageModel.dart';
import '../../../Redux/AppState.dart';
import '../../../Redux/ChatMessagePage/ChatMessagePageAction.dart';
import '../../../Variables/Utils.dart';
import 'ImageModal.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, ChatMessagePageState>(
        converter: (store) => store.state.chatMessagePageState,
        builder: (context, chatMessagePageState) => Container(
              margin: const EdgeInsets.only(bottom: 30, top: 40),
              child: DashChat(
                currentUser: ChatUser(
                  id: store.state.chatRoomPageState.currentChatRoom.idClient2
                          ?.idClient
                          .toString() ??
                      '-1',
                  firstName: store.state.chatRoomPageState.currentChatRoom
                          .idClient2?.fio ??
                      'Врач',
                ),
                onSend: (ChatMessage m) {
                  store.dispatch(AddChatMessageAction(ChatMessageModel(
                      message: m.text,
                      idClient: store.state.chatRoomPageState.currentChatRoom.idClient,
                      idChatRoom: store.state.chatRoomPageState.currentChatRoom
                          .idChatRoom)));
                  store.dispatch(putMessageThunkAction(store));
                },
                messageOptions: MessageOptions(
                  showTime: true,
                  onPressAvatar: (ChatUser user) {
                    showDialog(
                        context: context,
                        builder: (_) => UserModal(client: user)
                    );
                  },
                  onTapMedia: (ChatMedia media) async {
                    await showDialog(
                        context: context,
                        builder: (_) => ImageModal(
                              path: media.url,
                            ));
                  },
                ),
                messageListOptions: MessageListOptions(
                  onLoadEarlier: () {
                    // вызов для подгрузки предыдущих сообщений
                    store.dispatch(NextMessagePage());
                    store.dispatch(getNextChatMessageListThunkAction(store));

                    return Future(() => null);
                  },
                  //dateSeparatorFormat: DateFormat.yMMMMd('ru').add_Hm(),
                  scrollPhysics: const BouncingScrollPhysics(),
                  dateSeparatorBuilder: (date) => Card(
                    color: Colors.white70,
                    child: Text(
                      DateFormat.yMMMMd('ru').format(date),
                      style: const TextStyle(
                          color: Color.fromRGBO(39, 105, 171, 1), fontSize: 20),
                    ),
                  ),
                ),
                inputOptions: InputOptions(
                  alwaysShowSend: true,
                  inputDecoration: const InputDecoration(
                    hintText: "Напишите сообщение...",
                  ),
                  leading: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.photo,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        _onImageButtonPressed(ImageSource.gallery, store,
                            context: context);
                      },
                    ),
                  ],
                ),
                messages: chatMessagePageState.chatMessage
                    .map((e) => ChatMessage(
                          medias: e.imageMessageTables?.map((element) {
                            return ChatMedia(
                              type: MediaType.image,
                              fileName: 'image.png',
                              url:
                                  '${baseUrlApi}image-message/${element.idImageMessage}',
                            );
                          }).toList(),
                          text: e.message ?? '',
                          status: MessageStatus.pending,
                          user: ChatUser(
                            id: e.idDoctor2 == null
                                ? e.idClient2?.idClient.toString() ?? '-1'
                                : e.idDoctor2?.iddoctorTable.toString() ?? '-1',
                            firstName: e.idDoctor2 == null
                                ? e.idClient2?.fio ?? 'Клиент'
                                : e.idDoctor2?.fio ?? 'Доктор',
                          ),
                          createdAt: e.dateCreated ?? DateTime.now(),
                        ))
                    .toList(),
              ),
            ));
  }

  Future<void> _onImageButtonPressed(ImageSource source, Store<AppState> store,
      {BuildContext? context, bool isMultiImage = false}) async {
    final ImagePicker picker = ImagePicker();

    await _displayPickImageDialog(context!,
        (double? maxWidth, double? maxHeight, int? quality) async {
      try {
        final List<XFile> pickedFileList = await picker.pickMultiImage();
        store.dispatch(SetListFile(pickedFileList));
      } catch (e) {
        print(e);
      }
    });
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return onPick(null, null, null);
  }
}
