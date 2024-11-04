// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/models/wars_model.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';
import 'package:murshid/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodsList = [];
  List<WarsModel> warsList = [];

  Future<void> getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());

      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((snapshot) => snapshot.docs.forEach((doc) async {
                await getWarsList(
                    doc); // Fetch and populate warsList for each period

                historicalPeriodsList.add(HistoricalPeriodsModel.fromJson(
                  doc.data(),
                  List.from(warsList), // Pass a copy to avoid mutation
                ));

                emit(GetHistoricalPeriodsSuccess());
              }));
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errmessage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    warsList.clear(); // Clear to avoid duplicating wars across periods

    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then((snapshot) => snapshot.docs.forEach((warDoc) {
              warsList.add(WarsModel.fromlJson(warDoc.data()));
            }));
  }
}
