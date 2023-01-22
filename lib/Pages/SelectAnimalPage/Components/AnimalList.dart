import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_pass/Model/AnimalModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:redux/redux.dart';

import '../../../Redux/SelectAnimalPage/SelectAnimalActions.dart';
import '../../../Redux/SelectAnimalPage/SelectAnimalState.dart';

class AnimalList extends StatelessWidget {
  const AnimalList({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, SelectAnimalState>(
        converter: (store) => store.state.selectAnimalState,
        builder: (context, selectAnimalState) => selectAnimalState.isLoading ==
                1
            ? ListView(
                padding: const EdgeInsets.only(left: 0, top: 50),
                children: selectAnimalState.animalList
                    .map(
                      (i) => Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (_) {
                          store.dispatch(ChangeCurrentAnimal(i));
                          store.dispatch(deleteAnimalThunkAction(store));
                        },
                        child: Card(
                          color: primaryLightColor,
                          child: ListTile(
                            onTap: () {
                              store.dispatch(ChangeCurrentAnimal(i));
                              store.dispatch(navigateThunkAction(store));
                            },
                            leading: const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/images/animal.jpg'),
                            ),
                            title: Text(
                              i.name ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              i.idType2?.type ?? "",
                              style: const TextStyle(fontSize: 14),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    )
                    .toList())
            : Center(
                child: Center(
                  child: Lottie.asset(
                    'assets/images/loader.json',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                ),
              ));
  }
}
