import 'dart:convert';
import 'dart:io';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'package:vet_pass/Model/PrescriptionModel.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:vet_pass/Variables/GlobalVariables.dart';


class ChangePrescriptionAction {
  final List<PrescriptionModel> prescriptionModel;
  ChangePrescriptionAction(this.prescriptionModel);
}

class ResetPrescriptionAction {}

class IsLoadPrescriptionPageAction{}
class IsLoadedPrescriptionPageAction{}

ThunkAction<AppState> getPrescriptionListPageThunkAction = (Store store) async {
  store.dispatch(IsLoadPrescriptionPageAction());
  _getPrescription(store.state).then((value) {
    store.dispatch(ChangePrescriptionAction(value));
    store.dispatch(IsLoadedPrescriptionPageAction());
  });
};

Future<List<PrescriptionModel>> _getPrescription(AppState state) async{
  List<PrescriptionModel> result = const <PrescriptionModel>[];
  var client = http.Client();
  try {
    var response = await client.get(
      Uri.parse('${baseUrlApi}prescription/visit/${state.calendarPageState.currentVisit.idvisitTable}'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader : 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader : 'Bearer $token',
      },
    );
    if(response.statusCode == 200){
      Iterable l = jsonDecode(response.body);
      List<PrescriptionModel> temp = List<PrescriptionModel>.from(l.map((model)=> PrescriptionModel.fromJson(model)));
      result = temp;
    }
  } finally {
    client.close();
  }
  return result;
}