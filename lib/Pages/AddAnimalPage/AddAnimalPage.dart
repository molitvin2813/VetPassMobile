import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vet_pass/Pages/AddAnimalPage/Widget/AddAnimalForm.dart';
import 'package:vet_pass/Pages/AddAnimalPage/Widget/AddAnimalHeader.dart';
import 'package:vet_pass/Redux/AddAnimalPage/AddAnimalState.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../Redux/AddAnimalPage/AddAnimalPageActions.dart';

class AddAnimalPage extends StatefulWidget {
  const AddAnimalPage({Key? key}) : super(key: key);

  @override
  AddAnimalState createState() => AddAnimalState();
}

class AddAnimalState extends State<AddAnimalPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    Store<AppState>? store = StoreProvider.of<AppState>(context);
    store.dispatch(ResetAnimalAction());
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AddAnimalPageState>(
        converter: (store) => store.state.addAnimalPageState,
        builder: (context, addAnimalPageState) => Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(107, 211, 248, 1),
                image: DecorationImage(
                    image: AssetImage('assets/images/loginBG2.png'),
                    fit: BoxFit.cover),
              ),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: const [
                        AddAnimalHeader(),
                        AddAnimalForm(),
                      ],
                    ),
                  )),
            ));
  }
}
