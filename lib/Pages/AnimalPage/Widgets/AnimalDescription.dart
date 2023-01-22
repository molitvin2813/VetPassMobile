import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/AnimalPage/Widgets/PrescriptionList.dart';
import 'package:vet_pass/Redux/AnimalPage/AnimalPageAction.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

import '../../../Redux/AnimalPage/AnimalPageState.dart';
import '../../../Redux/AppState.dart';

class AnimalDescription extends StatelessWidget {
  const AnimalDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AnimalPageState>(
      converter: (store) => store.state.animalPageState,
      builder: (context, animalPageState) => Container(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              animalPageState.animal.name ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: secondaryColor,
                shadows: [
                  Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(3, 2))
                ],
                fontSize: 46,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lumberjack',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      color: primaryLightColor,
                      child: ListTile(
                        title: Text(
                          animalPageState.animal.age.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: primaryColorCard,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lumberjack',
                          ),
                        ),
                        subtitle: const Text(
                          "Возраст",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: primaryColorCard,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: primaryLightColor,
                      child: ListTile(
                        title: Text(animalPageState.animal.weight.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: primaryColorCard,
                              fontFamily: 'Lumberjack',
                            )),
                        subtitle: const Text(
                          "Вес",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: primaryColorCard,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: primaryLightColor,
                      child: ListTile(
                        title: Text(animalPageState.animal.gender ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: primaryColorCard,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Lumberjack',
                            )),
                        subtitle: const Text(
                          "Пол",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: primaryColorCard,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Ваши последние предписания",
                    textAlign: TextAlign.left,
                    style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lumberjack',
                      color: secondaryColor,
                      shadows: [
                        Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(3, 2))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PrescriptionList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
