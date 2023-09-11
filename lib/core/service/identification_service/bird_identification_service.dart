import 'dart:io';
import 'package:birdworld/core/config/app/app_config.dart';
import 'package:dio/dio.dart';

class BirdIdentificationService {
  Dio dio = Dio();
  Future<Map<String, dynamic>> predictImage(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'file':
            await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      Response response =
          await dio.post(AppConfig.identificationApibaseurl, data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 'IDENTIFILED') {
          return {
            'status': 'IDENTIFILED',
            'prediction': {
              'id': responseData['prediction']['id'],
              'name': responseData['prediction']['name'],
            },
          };
        } else {
          return {'status': 'NOT IDENTIFIED'};
        }
      } else {
        return {'error': 'API error'};
      }
    } catch (e) {
      return {'error': 'Network error: $e'};
    }
  }
}
