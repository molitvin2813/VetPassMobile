import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalState.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageAction.dart';
import 'package:vet_pass/Redux/NewsPage/NewsPageState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Utils.dart';

class AddAnimalHeader extends StatelessWidget {
  const AddAnimalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, AddAnimalPageState>(
      converter: (store) => store.state.addAnimalPageState,
      builder: (context, addAnimalPageState) => Container(
          padding: const EdgeInsets.only(left: 0, top: 50),
          child: const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Добавление нового питомца",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(240, 240, 240, 1),
                shadows: [
                  Shadow(
                      blurRadius: 5, color: Colors.black, offset: Offset(3, 2))
                ],
                fontSize: 36,
                fontFamily: 'Lumberjack',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
