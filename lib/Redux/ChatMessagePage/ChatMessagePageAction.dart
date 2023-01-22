import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/ChatMessageModel.dart';
import 'package:vet_pass/Model/ImageMessageModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';
import 'package:http_parser/http_parser.dart';

class ChangeChatMessageListAction {
  final List<ChatMessageModel> listMessage;

  ChangeChatMessageListAction(this.listMessage);
}

class AddChatMessageAction {
  final ChatMessageModel chatMessageModel;

  AddChatMessageAction(this.chatMessageModel);
}

class AddAllChatMessageAction {
  final List<ChatMessageModel> listMessage;

  AddAllChatMessageAction(this.listMessage);
}

class ClearChatMessageListAction {}

class SetListFile {
  final List<XFile> imageFileList;

  SetListFile(this.imageFileList);
}

class IsLoad {}

class IsLoaded {}

class IsAllLoad {}

class IsAllLoaded {}

class NextMessagePage {}

class ClearMessagePage {}

ThunkAction<AppState> getChatMessageListThunkAction = (Store store) async {
  _getChatMessageList(store.state).then((value) {
    store.dispatch(ChangeChatMessageListAction(value));
  });
};

Future<List<ChatMessageModel>> _getChatMessageList(AppState state) async {
  List<ChatMessageModel> result = <ChatMessageModel>[];
  print(state.chatMessagePageState.isLoadingChatMessagePage);

  var client = http.Client();
  try {
    var response = await client.post(
        Uri.parse('${baseUrlApi}chat-message/page/0'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: json.encode(<String, String>{
          'room': state.chatRoomPageState.currentChatRoom.idChatRoom.toString()
        }));

    if (response.statusCode == 201) {
      Iterable temp = jsonDecode(response.body);
      List<ChatMessageModel> posts = List<ChatMessageModel>.from(
          temp.map((model) => ChatMessageModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }

  return result;
}

ThunkAction<AppState> putMessageThunkAction = (Store store) async {
  _putMessage(store.state).then((value) {
    store.dispatch(getChatMessageListThunkAction(store as Store<AppState>));
  });
};

Future<void> _putMessage(AppState state) async {
  var client = http.Client();
  try {
    // Добавляем новое соббщение
    var response = await client.post(Uri.parse('${baseUrlApi}chat-message/'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: state.chatMessagePageState.chatMessage.last.toJson());

    // Получаем вставленное сообщение
    var insertedChatMessage =
        ChatMessageModel.fromJson(jsonDecode(response.body));

    // Отправляем изображение
    var request =
        http.MultipartRequest("POST", Uri.parse('${baseUrlApi}image-message/'));

    request.headers['authorization'] = 'Bearer $token';
    for (var element in state.chatMessagePageState.imageFileList) {
      request.files.add(await MultipartFile.fromPath(
        'file',
        element.path,
        filename: element.name,
        contentType: MediaType('image', element.mimeType ?? ''),
      ));
    }

    // Получаем отправленное изображение
    var insertedImage = ImageMessageModel.fromJson(await request
        .send()
        .then((value) async => jsonDecode(await value.stream.bytesToString())));

    // Обновляем запись об изображении id сообщения, к которому прикреплено

    if (insertedImage.idImageMessage != null) {
      await client.put(
          Uri.parse(
              '${baseUrlApi}image-message/${insertedImage.idImageMessage}'),
          headers: <String, String>{
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          body: ImageMessageModel(
            idImageMessage: insertedImage.idImageMessage,
            idMessage: insertedChatMessage.idMessage,
            path: insertedImage.path,
          ).toJson());
    }
  } finally {
    client.close();
  }
  return;
}

ThunkAction<AppState> getNextChatMessageListThunkAction = (Store store) async {
  store.dispatch(IsAllLoad());
  _getNextChatMessageList(store.state).then((value) {
    store.dispatch(IsLoaded());
    if (value.isEmpty) {
      store.dispatch(IsAllLoaded());
    } else {
      store.dispatch(AddAllChatMessageAction(value));
    }
  });
};

Future<List<ChatMessageModel>> _getNextChatMessageList(AppState state) async {
  List<ChatMessageModel> result = <ChatMessageModel>[];
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.parse(
            '${baseUrlApi}chat-message/page/${state.chatMessagePageState.page}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: json.encode(<String, String>{
          'room': state.chatRoomPageState.currentChatRoom.idChatRoom.toString()
        }));

    if (response.statusCode == 201) {
      Iterable temp = jsonDecode(response.body);
      List<ChatMessageModel> posts = List<ChatMessageModel>.from(
          temp.map((model) => ChatMessageModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}
