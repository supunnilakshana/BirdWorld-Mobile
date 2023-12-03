// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:birdworld/core/models/app_user.dart';
import 'package:birdworld/core/models/post_comment.dart';
import 'package:birdworld/core/models/post_like.dart';

class Post {
  final int? id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime created;
  final DateTime updated;
  final AppUser user;
  final List<PostComment> comments;
  final List<PostLike> likes;
  Post({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.created,
    required this.updated,
    required this.user,
    required this.comments,
    required this.likes,
  });

  Post copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? created,
    DateTime? updated,
    AppUser? user,
    List<PostComment>? comments,
    List<PostLike>? likes,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      user: user ?? this.user,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
      'user': user.toMap(),
      'comments': comments.map((x) => x.toMap()).toList(),
      'likes': likes.map((x) => x.toMap()).toList(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      user: AppUser.fromMap(map['user'] as Map<String, dynamic>),
      comments: List<PostComment>.from(
        (map['comments']).map<PostComment>(
          (x) => PostComment.fromMap(x as Map<String, dynamic>),
        ),
      ),
      likes: List<PostLike>.from(
        (map['likes']).map<PostLike>(
          (x) => PostLike.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, title: $title, description: $description, imageUrl: $imageUrl, created: $created, updated: $updated, user: $user, comments: $comments, likes: $likes)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.created == created &&
        other.updated == updated &&
        other.user == user &&
        listEquals(other.comments, comments) &&
        listEquals(other.likes, likes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        user.hashCode ^
        comments.hashCode ^
        likes.hashCode;
  }
}
