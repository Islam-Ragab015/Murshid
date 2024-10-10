import 'package:murshid/core/utils/app_strings.dart';

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String discription;

  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
    );
  }

  HistoricalPeriodsModel({
    required this.name,
    required this.image,
    required this.discription,
  });
}
