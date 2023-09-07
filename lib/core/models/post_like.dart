// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:birdworld/core/models/app_user.dart';

class PostLike {
  final int id;
  final DateTime created;
  final DateTime updated;
  final int postID;
  final String userId;
  final AppUser user;
  PostLike({
    required this.id,
    required this.created,
    required this.updated,
    required this.postID,
    required this.userId,
    required this.user,
  });

  PostLike copyWith({
    int? id,
    DateTime? created,
    DateTime? updated,
    int? postID,
    String? userId,
    AppUser? user,
  }) {
    return PostLike(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      postID: postID ?? this.postID,
      userId: userId ?? this.userId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'postID': postID,
      'userId': userId,
      'user': user.toMap(),
    };
  }

  factory PostLike.fromMap(Map<String, dynamic> map) {
    return PostLike(
      id: map['id'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated'] as int),
      postID: map['postID'] as int,
      userId: map['userId'] as String,
      user: AppUser.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostLike.fromJson(String source) =>
      PostLike.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostLike(id: $id, created: $created, updated: $updated, postID: $postID, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(covariant PostLike other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created == created &&
        other.updated == updated &&
        other.postID == postID &&
        other.userId == userId &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        postID.hashCode ^
        userId.hashCode ^
        user.hashCode;
  }
}
