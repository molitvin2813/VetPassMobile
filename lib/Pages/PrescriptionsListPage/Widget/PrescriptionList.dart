import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/PrescriptionsListPage/PrescriptionPageState.dart';

import '../../../Redux/AppState.dart';
import '../../../Variables/Constants.dart';
import '../../../Variables/Utils.dart';

class PrescriptionList extends StatelessWidget {
  const PrescriptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, PrescriptionPageState>(
      converter: (store) => store.state.prescriptionPageState,
      builder: (context, prescriptionPageState) => Container(
        margin: const EdgeInsets.only(top: 10),
        child: prescriptionPageState.prescriptionModel.isNotEmpty
            ? ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 80),
                children: prescriptionPageState.prescriptionModel
                    .map((value) => Card(
                          color: HexColor.fromHex(
                              value.idTypePrescription2?.color ?? '#FFF'),
                          child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      value.idTypePrescription2?.type ?? '',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: primaryColorCard,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Lumberjack',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      value.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: primaryColorCard,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Lumberjack',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  value.description ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: primaryColorCard,
                                  ),
                                ),
                              )),
                        ))
                    .toList())
            : const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(
                  'У вас еще нет каких-либо предписаний',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lumberjack',
                    color: Color.fromRGBO(240, 240, 240, 1),
                    shadows: [
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(3, 2))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
