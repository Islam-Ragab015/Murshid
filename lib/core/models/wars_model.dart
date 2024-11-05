import 'package:murshid/core/models/data_model.dart';
import 'package:murshid/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  WarsModel({
    required super.name,
    required super.image,
    required super.description,
  });

  factory WarsModel.fromlJson(Map<String, dynamic> jsonData) {
    return WarsModel(
      name: jsonData[FireBaseStrings.name] ?? 'Unknown War',
      image: jsonData[FireBaseStrings.image] ?? 'default_image.png',
      description:
          jsonData[FireBaseStrings.description] ?? 'No description available',
    );
  }
}
