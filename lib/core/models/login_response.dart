import 'dart:convert';

import 'package:birdworld/core/models/app_user.dart';

class LoginResponse {
  final String token;
  final AppUser user;
  LoginResponse({
    required this.token,
    required this.user,
  });

  LoginResponse copyWith({
    String? token,
    AppUser? user,
  }) {
    return LoginResponse(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] as String,
      user: AppUser.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(token: $token, user: $user)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
