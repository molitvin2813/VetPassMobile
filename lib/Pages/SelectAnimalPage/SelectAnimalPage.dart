import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:vet_pass/Pages/AddAnimalPage/AddAnimalPage.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../Redux/AddAnimalPage/AddAnimalPageActions.dart';
import '../../Redux/AppState.dart';
import '../../Redux/SelectAnimalPage/SelectAnimalActions.dart';
import '../../Variables/GlobalVariables.dart';
import 'Components/AnimalList.dart';

class SelectAnimalPage extends StatelessWidget {
  const SelectAnimalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);


    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(107, 211, 248, 1),
        image: DecorationImage(
            image: AssetImage('assets/images/loginBG2.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Добавить питомца'),
          icon: const Icon(Icons.add),
          onPressed: () {
            store.dispatch(getAnimalTypeListThunkAction(store));
            store.dispatch(SetAnimalClientAction(idClient));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddAnimalPage()));

          },
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 0, top: 50),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Список ваших\nпитомцев",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(240, 240, 240, 1),
                        shadows: [
                          Shadow(
                              blurRadius: 5,
                              color: Colors.black,
                              offset: Offset(3, 2))
                        ],
                        fontSize: 36,
                        fontFamily: 'Lumberjack',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
              Expanded(child: const AnimalList().build(context)),
            ],
          ),
        ]),
      ),
    );
  }
}
