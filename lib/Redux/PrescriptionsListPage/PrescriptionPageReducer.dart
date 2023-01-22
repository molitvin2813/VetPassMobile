import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/PrescriptionsListPage/PrescriptionPageAction.dart';

import '../../Model/PrescriptionModel.dart';

Reducer<bool> isLoadingPrescriptionPageReducer = combineReducers([
  TypedReducer<bool, IsLoadPrescriptionPageAction>(_isLoad),
  TypedReducer<bool, IsLoadedPrescriptionPageAction>(_isLoaded),
]);

bool _isLoad(bool value, IsLoadPrescriptionPageAction action) => false;
bool _isLoaded(bool value, IsLoadedPrescriptionPageAction action) => true;

Reducer<List<PrescriptionModel>> listPrescriptionPageReducer = combineReducers([
  TypedReducer<List<PrescriptionModel>, ChangePrescriptionAction>(_changePrescription),
  TypedReducer<List<PrescriptionModel>, ResetPrescriptionAction>(_resetPrescription),
]);

List<PrescriptionModel> _changePrescription(List<PrescriptionModel> value, ChangePrescriptionAction action) => action.prescriptionModel;
List<PrescriptionModel> _resetPrescription(List<PrescriptionModel> value, ResetPrescriptionAction action ) => const <PrescriptionModel>[];