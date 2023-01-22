import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Model/NewsModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';

import '../../Model/TypeNewsModel.dart';


class GetListNewsAction {
  final List<NewsModel> listNews;
  GetListNewsAction(this.listNews);
}
class IsLoadAction{}
class IsLoadedAction{}

class IsAllLoadAction{}
class IsAllLoadedAction{}

class NextPageAction{}
class PrevPageAction{}
class ClearPageAction{}

class ChangeCurrentTypeIDAction{
  final int typeID;
  ChangeCurrentTypeIDAction(this.typeID);
}
class ClearCurrentTypeIDAction{}

class GetNextListNewsAction{
  final List<NewsModel> listNews;
  GetNextListNewsAction(this.listNews);
}
class GetNewsByTypeAction{
  final List<NewsModel> listNews;
  GetNewsByTypeAction(this.listNews);
}
class GetTypeListAction{
  final List<TypeNewsModel> typeList;
  GetTypeListAction(this.typeList);
}

class ClearListNewsAction{}


ThunkAction<AppState> getNewsByTypeThunkAction = (Store store) async {
  await store.dispatch(ClearPageAction());
  await store.dispatch(ClearListNewsAction());
  await store.dispatch(IsAllLoadAction());
  _getNewsListByType(store.state).then((value){
    store.dispatch(GetNewsByTypeAction(value));
  });
};

ThunkAction<AppState> updateNewsListByTypeThunkAction = (Store store) async {
  //store.dispatch(IsAllLoadAction());
  store.dispatch(NextPageAction());
  _getNewsListByType(store.state).then((value) {
    if(value.isEmpty) {
      store.dispatch(IsAllLoadedAction());
    }
    else {
      store.dispatch(GetNextListNewsAction(value));
    }
  });

};

Future<List<NewsModel>> _getNewsListByType(AppState state) async{
  List<NewsModel> result = <NewsModel>[];
  var client = http.Client();
  try {
    print(state.newsPageState.currentTypeID);
    var response = await client.post(
        Uri.parse('${baseUrlApi}news/page/type/${state.newsPageState.pageNumber}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        },
        body: json.encode(<String, String>{
          'idType': state.newsPageState.currentTypeID.toString()
        }),
    );
    if(response.statusCode == 201){
      Iterable l = jsonDecode(response.body);
      List<NewsModel> posts = List<NewsModel>.from(l.map((model)=> NewsModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}


ThunkAction<AppState> getTypeListThunkAction = (Store store) async {
  store.dispatch(IsLoadAction());
  _getTypeList(store.state).then((value){
    store.dispatch(GetTypeListAction(value));
    store.dispatch(IsLoadedAction());
  });
};

Future<List<TypeNewsModel>> _getTypeList(AppState state) async{
  List<TypeNewsModel> result = <TypeNewsModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
        Uri.parse('${baseUrlApi}type-news'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){
      Iterable l = jsonDecode(response.body);
      List<TypeNewsModel> posts = List<TypeNewsModel>.from(l.map((model)=> TypeNewsModel.fromJson(model)));
      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}


ThunkAction<AppState> getNewsListThunkAction = (Store store) async {
  store.dispatch(IsLoadAction());
  _getNewsList(store.state).then((value){
    store.dispatch(GetListNewsAction(value));
    store.dispatch(IsLoadedAction());
  });
};

ThunkAction<AppState> updateNewsListThunkAction = (Store store) async {
  //store.dispatch(IsAllLoadAction());
  store.dispatch(NextPageAction());
  _getNewsList(store.state).then((value) {
    if(value.isEmpty) {
      store.dispatch(IsAllLoadedAction());
    }
    else {
      store.dispatch(GetNextListNewsAction(value));
    }
  });

};

Future<List<NewsModel>> _getNewsList(AppState state) async{
  List<NewsModel> result = <NewsModel>[];
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.parse('${baseUrlApi}news/page/${state.newsPageState.pageNumber}'),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader : 'Bearer $token',
        }
    );

    if(response.statusCode == 201){
      Iterable l = jsonDecode(response.body);
      List<NewsModel> posts = List<NewsModel>.from(l.map((model)=> NewsModel.fromJson(model)));

      result = posts;
    }
  } finally {
    client.close();
  }
  return result;
}

