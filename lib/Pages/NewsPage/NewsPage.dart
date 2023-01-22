import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/NewsPage/Widget/NewsList.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Pages/NewsPage/Widget/NewsTypeList.dart';
import 'package:vet_pass/Variables/Constants.dart';
import '../../Redux/AppState.dart';
import '../../Redux/CalendarPage/CalendarPageState.dart';


class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);


    return Container(
      decoration: const BoxDecoration(

        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(101, 159, 226, 1),
            Color.fromRGBO(240, 240, 240, 1),
          ],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
        ),
        image: DecorationImage(
            image: AssetImage('assets/images/loginBG.png'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
              child: Text(
                "Все последние новости",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, color: Color.fromRGBO(240, 240, 240, 1),  shadows: [Shadow(blurRadius: 5, color: Colors.black, offset: Offset(3,2))], fontWeight: FontWeight.w700,),
              ),
            )
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 5, ),
            child: NewsTypeList(),
          ),
          Expanded(flex: 1,child: NewsList(),),
        ],
      ),
    );
  }
}
