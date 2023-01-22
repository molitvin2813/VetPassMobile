import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vet_pass/Model/AnimalTypeModel.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalPageActions.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalState.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Variables/Constants.dart';

class AddAnimalForm extends StatelessWidget {
  const AddAnimalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, AddAnimalPageState>(
      converter: (store) => store.state.addAnimalPageState,
      builder: (context, addAnimalPageState) => Container(
        padding:
            const EdgeInsets.only(right: 35, left: 35, top: 35, bottom: 20),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: TextField(
                  onChanged: (value) =>
                      store.dispatch(SetAnimalNameAction(value)),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.person),
                    ),
                    hintText: 'Кличка',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                    color: primaryLightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child:DropdownButtonFormField<String>(
                        elevation: 40,
                        value: addAnimalPageState.animal.gender,
                        items: <String>['Самец', 'Самка']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            store.dispatch(SetAnimalGenderAction(value!))),),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            color: primaryLightColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: DropdownButtonFormField(
                  elevation: 40,
                  isExpanded: true,
                  value: addAnimalPageState.currAnimalType,
                  items: addAnimalPageState.animalType
                      .map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value.type ?? '',
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    );
                  }).toList(),

                  onChanged: (value) {
                    store.dispatch(SetAnimalTypeCurrAction(value!));
                    store.dispatch(SetAnimalTypeAction(value!));
                  }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CheckboxListTile(
              side: const BorderSide(
                  color: primaryColor,
                  width: 3,
                  strokeAlign: StrokeAlign.center),
              tileColor: primaryLightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              title: const Text(
                'Питомец кастрирован?',
                style: TextStyle(color: Colors.black54),
              ),
              value: addAnimalPageState.animal.isCastrated == 1 ? true : false,
              onChanged: (value) => store
                  .dispatch(SetAnimalIsCastratedAction(value == true ? 1 : 0))),
          const SizedBox(
            height: 30,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              store
                  .dispatch(SetAnimalWeightAction(double.tryParse(value) ?? 0));
            },
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.edit),
              ),
              hintText: 'Вес',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            onChanged: (value) {
              store.dispatch(SetAnimalAgeAction(int.tryParse(value) ?? 0));
            },
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.edit),
              ),
              hintText: 'Возраст',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Добавить питомца',
                style: TextStyle(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  fontSize: 27,
                  shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(3, 2))
                  ],
                  fontFamily: 'Lumberjack',
                  fontWeight: FontWeight.w700,
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  iconSize: 40,
                  onPressed: () {
                    if (addAnimalPageState.animal.gender != '' &&
                        addAnimalPageState.animal.name != '' &&
                        addAnimalPageState.animal.isCastrated != -1 &&
                        addAnimalPageState.animal.age != -1 &&
                        addAnimalPageState.animal.weight != -1) {

                      store.dispatch(registerAnimalThunkAction(store));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Для успешного добавления необходимо заполнить все поля ')),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    shadows: [
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(3, 2))
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
