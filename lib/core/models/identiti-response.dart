// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BirdIdentityData {
  final String id;
  final String name;
  final String status;
  BirdIdentityData({
    this.id = "N/A",
    this.name = "N/A",
    required this.status,
  });

  BirdIdentityData copyWith({
    String? id,
    String? name,
    String? status,
  }) {
    return BirdIdentityData(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
    };
  }

  factory BirdIdentityData.fromMap(Map<String, dynamic> map) {
    return BirdIdentityData(
      id: map['id'] as String,
      name: map['name'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirdIdentityData.fromJson(String source) =>
      BirdIdentityData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BirdIdentityData(id: $id, name: $name, status: $status)';

  @override
  bool operator ==(covariant BirdIdentityData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ status.hashCode;
}
