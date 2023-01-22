import 'package:flutter/material.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageAction.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../../Redux/AnimalPage/AnimalPageState.dart';
import '../../../Redux/AppState.dart';


class AnimalImage extends StatelessWidget {
  const AnimalImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AnimalPageState>(
      converter: (store) => store.state.animalPageState,
      builder: (context, animalPageState) => Container(
        decoration:  BoxDecoration(
          color: animalPageState.animalImage.color,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child:
            Image(image: AssetImage(animalPageState.animalImage.path), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
