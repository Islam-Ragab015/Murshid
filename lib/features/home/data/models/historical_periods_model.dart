import 'package:murshid/core/models/data_model.dart';
import 'package:murshid/core/models/wars_model.dart';
import 'package:murshid/core/utils/app_strings.dart';

class HistoricalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalPeriodsModel({
    required super.name,
    required super.image,
    required super.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(
      Map<String, dynamic> jsonData, List<WarsModel> warsList) {
    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name] ?? 'Unknown Period',
      image: jsonData[FireBaseStrings.image] ?? 'default_image.png',
      description:
          jsonData[FireBaseStrings.description] ?? 'No description available',
      wars: warsList,
    );
  }
}
