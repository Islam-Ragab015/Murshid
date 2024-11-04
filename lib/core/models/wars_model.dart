import 'package:murshid/core/models/data_model.dart';
import 'package:murshid/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  WarsModel({
    required super.name,
    required super.image,
    required super.discription,
  });

  factory WarsModel.fromlJson(Map<String, dynamic> jsonData) {
    return WarsModel(
      name: jsonData[FireBaseStrings.name] ?? 'Unknown War',
      image: jsonData[FireBaseStrings.image] ?? 'default_image.png',
      discription:
          jsonData[FireBaseStrings.discription] ?? 'No description available',
    );
  }
}
