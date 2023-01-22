import 'package:flutter/cupertino.dart';
import '../../Model/PrescriptionModel.dart';


@immutable
class PrescriptionPageState{
  final List<PrescriptionModel> prescriptionModel;
  final bool isLoadingPrescriptionPage;

  const PrescriptionPageState(
      {
        required this.prescriptionModel,
        required this.isLoadingPrescriptionPage,
      });

  const PrescriptionPageState.initialState()
      : prescriptionModel = const <PrescriptionModel>[],
        isLoadingPrescriptionPage = false;
}