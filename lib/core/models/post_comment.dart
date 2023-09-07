// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:birdworld/core/models/app_user.dart';

class PostComment {
  final int id;
  final String context;
  final DateTime created;
  final DateTime updated;
  final int postID;
  final String userId;
  final AppUser user;
  PostComment({
    required this.id,
    required this.context,
    required this.created,
    required this.updated,
    required this.postID,
    required this.userId,
    required this.user,
  });

  PostComment copyWith({
    int? id,
    String? context,
    DateTime? created,
    DateTime? updated,
    int? postID,
    String? userId,
    AppUser? user,
  }) {
    return PostComment(
      id: id ?? this.id,
      context: context ?? this.context,
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
      'context': context,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'postID': postID,
      'userId': userId,
      'user': user.toMap(),
    };
  }

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      id: map['id'] as int,
      context: map['context'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated'] as int),
      postID: map['postID'] as int,
      userId: map['userId'] as String,
      user: AppUser.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComment.fromJson(String source) =>
      PostComment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostComment(id: $id, context: $context, created: $created, updated: $updated, postID: $postID, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(covariant PostComment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.context == context &&
        other.created == created &&
        other.updated == updated &&
        other.postID == postID &&
        other.userId == userId &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        context.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        postID.hashCode ^
        userId.hashCode ^
        user.hashCode;
  }
}
