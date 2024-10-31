import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';
import 'package:murshid/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodsList = [];
  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) => value.docs.forEach((element) {
                historicalPeriodsList
                    .add(HistoricalPeriodsModel.fromJson(element.data()));
              }));
      emit(GetHistoricalPeriodsSuccess());
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errmessage: e.toString()));
    }
  }
}
