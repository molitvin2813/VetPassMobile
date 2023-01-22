import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageAction.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Utils.dart';

class NewsTypeList extends StatelessWidget {
  const NewsTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, NewsPageState>(
        converter: (store) => store.state.newsPageState,
        builder: (context, newsPageState) => ListView(
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            children: newsPageState.typeList
                .map((value) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: FilterChip(
                        label: Text(
                          value.type ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(2, 1))
                            ],
                            fontFamily: 'Lumberjack',
                          ),
                        ),
                        backgroundColor:
                            HexColor.fromHex(value.color ?? '#FFF'),
                        selected:
                            value.idTypeNews == newsPageState.currentTypeID,
                        onSelected: (isSelected) {
                          if (newsPageState.currentTypeID != value.idTypeNews) {
                            store.dispatch(
                                ChangeCurrentTypeIDAction(value.idTypeNews));
                            store.dispatch(ClearPageAction());
                            store.dispatch(getNewsByTypeThunkAction(store));
                          } else {
                            store.dispatch(ClearCurrentTypeIDAction());
                            store.dispatch(ClearPageAction());
                            store.dispatch(IsAllLoadAction());
                            store.dispatch(getNewsListThunkAction(store));
                          }
                        },
                      ),
                    ))
                .toList()));
  }
}
