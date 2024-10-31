sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsSuccess extends HomeState {}

final class GetHistoricalPeriodsFailure extends HomeState {
  final String errmessage;

  GetHistoricalPeriodsFailure({required this.errmessage});
}

final class GetHistoricalPeriodsLoading extends HomeState {}
