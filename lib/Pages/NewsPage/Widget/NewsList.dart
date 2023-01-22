import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageState.dart';
import 'package:vet_pass/Variables/Utils.dart';
import '../../../Redux/AppState.dart';
import '../../../Redux/CalendarPage/CalendarPageState.dart';
import 'package:vet_pass/Model/SupportModel/Event.dart';

import '../../../Redux/NewsPage/NewsPageAction.dart';
import '../../../Variables/Constants.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // only execute pagination event if it's the last item
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        var store = StoreProvider.of<AppState>(context);
        if (store.state.newsPageState.allLoadedNewsPage == 0 &&
            store.state.newsPageState.currentTypeID == -1) {
          store.dispatch(updateNewsListThunkAction(store));
        } else if (store.state.newsPageState.allLoadedNewsPage == 0 &&
            store.state.newsPageState.currentTypeID != -1) {
          store.dispatch(updateNewsListByTypeThunkAction(store));
        }
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    Store<AppState>? store = StoreProvider.of<AppState>(context);
    store.dispatch(ClearListNewsAction());
    store.dispatch(ClearPageAction());
    store.dispatch(IsAllLoadAction());
    store.dispatch(ClearCurrentTypeIDAction());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, NewsPageState>(
      converter: (store) => store.state.newsPageState,
      builder: (context, newsPageState) => newsPageState.isLoadingNewsPage == 1
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: newsPageState.newsList.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (_, int index) {
                if (newsPageState.newsList.length == index) {
                  print(newsPageState.newsList.length);
                  if (newsPageState.allLoadedNewsPage == 1) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 90),
                      child: const Center(
                        child: Text('Новостей больше нет'),
                      ),
                    );
                  }
                  return Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 90),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Card(
                    color: Color.fromRGBO(133, 167, 179, 1),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor.fromHex(newsPageState
                                        .newsList[index].idNewsType2?.color ??
                                    '#FFF'),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            height: 50,
                            width: 20,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                  minWidth: double.infinity,
                                ),
                                margin: const EdgeInsets.only(
                                    right: 50, top: 10, left: 20),
                                child: Text(
                                  newsPageState.newsList[index].title ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                          blurRadius: 5,
                                          color: Colors.black,
                                          offset: Offset(3, 2))
                                    ],
                                    fontFamily: 'Lumberjack',
                                  ),
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                DateFormat.yMMMMd('ru').add_Hm().format(
                                    newsPageState.newsList[index].dateUpdated ??
                                        DateTime.now()),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            newsPageState.newsList[index].imageNewsTables
                                        ?.length ==
                                    0
                                ? Container()
                                : CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlay: false,
                                      aspectRatio: 2.0,
                                      enableInfiniteScroll: false,
                                      enlargeCenterPage: true,
                                    ),
                                    items: newsPageState
                                        .newsList[index].imageNewsTables
                                        ?.map((value) {
                                      return Container(
                                          margin: EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              child: Stack(
                                                children: <Widget>[
                                                  Image.network(
                                                      '${baseUrlApi}image-news/${value.idImageNews}',
                                                      fit: BoxFit.cover,
                                                      width: 1000.0),
                                                ],
                                              )));
                                    }).toList(),
                                  ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                newsPageState.newsList[index].text ?? "",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              },
            )
          : Center(
              child: Lottie.asset(
                'assets/images/loader.json',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ),
    );
  }
}
