// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  AppUser({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });

  AppUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
  }) {
    return AppUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] != null ? map['id'] as String : null,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, role: $role)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        role.hashCode;
  }
}
