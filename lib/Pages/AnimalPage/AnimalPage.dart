import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/AnimalPage/Widgets/AnimalDescription.dart';
import 'package:vet_pass/Pages/AnimalPage/Widgets/AnimalImage.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageAction.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../Redux/AnimalPage/AnimalPageState.dart';
import '../../Redux/AppState.dart';
import 'Widgets/PrescriptionList.dart';

class AnimalPage extends StatelessWidget {
  const AnimalPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: secondaryColor,
      body: StoreConnector<AppState, AnimalPageState>(
        converter: (store) => store.state.animalPageState,
        builder: (context, animalPageState) => Container(
          decoration:  BoxDecoration(
            color: animalPageState.animalImage.color,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(flex: 4,child: AnimalImage(),),
              Expanded(flex: 6,child: AnimalDescription(),),

            ],
          ),

        ),
      )
    );
  }

}
