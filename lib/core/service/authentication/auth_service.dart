import 'package:birdworld/core/api/api_client.dart';

class AuthService {
  ApiClient apiclient = ApiClient();

  Future<bool> signin(String email, String password) async {
    final res = await apiclient.get("post/Get");
    print(res);

    return true;
  }
}
