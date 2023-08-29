import 'package:birdworld/core/api/api_client.dart';
import 'package:birdworld/core/models/login_response.dart';

class AuthService {
  ApiClient apiclient = ApiClient();

  Future<bool> signin(String email, String password) async {
    final res = await apiclient.post<LoginResponse>("auth/signin",
        data: {"password": "C21484123", "email": "supanthsa@gmail.com"});
    print(res);

    return true;
  }
}
