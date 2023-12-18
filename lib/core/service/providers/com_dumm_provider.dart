import 'package:birdworld/core/config/constant/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:birdworld/core/models/app_user.dart';
import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/core/models/post_comment.dart';
import 'package:birdworld/core/models/post_like.dart';

class DataProvider extends ChangeNotifier {
  List<Post> _posts = postslistd;

  List<Post> get posts => _posts;

  void addPost(Post newPost) {
    _posts.add(newPost);
    notifyListeners();
  }

  void addCommentToPost(int postId, PostComment comment) {
    Post post = _posts.firstWhere((post) => post.id == postId);
    post.comments.add(comment);
    notifyListeners();
  }

  void addLikeToPost(int postId, PostLike like) {
    Post post = _posts.firstWhere((post) => post.id == postId);
    post.likes.add(like);
    notifyListeners();
  }
}
