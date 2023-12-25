import 'dart:io';
import 'package:birdworld/core/config/app/app_config.dart';
import 'package:birdworld/core/config/endapoints/api_endpoints.dart';
import 'package:birdworld/core/models/identiti-response.dart';
import 'package:dio/dio.dart';

class BirdIdentificationService {
  Dio dio = Dio();
  Future<BirdIdentityData> predictImage(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'file':
            await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      Response response = await dio.post(
          AppConfig.identificationApibaseurl + APIendPonts.predict,
          data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 'IDENTIFILED') {
          print(responseData['status']);
          return BirdIdentityData(
              status: 'IDENTIFILED',
              id: responseData['prediction']['id'].toString(),
              name: responseData['prediction']['name']);
        } else {
          return BirdIdentityData(status: "NOT IDENTIFIED");
        }
      } else {
        throw Exception("API Error");
      }
    } catch (e) {
      print(e);
      throw Exception("API Error");
    }
  }
}
