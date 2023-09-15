import 'package:birdworld/core/api/api_client.dart';
import 'package:birdworld/core/config/endapoints/api_endpoints.dart';
import 'package:birdworld/core/models/post.dart';

class CommunityService {
  final ApiClient apiclient = ApiClient();

  Future<List<Post>?> getAllPost() async {
    try {
      final List<Post> post = await apiclient
          .get<List<Post>>(APIendPonts.getAllPosts, isTokenNeeded: true);

      return post;
    } catch (e) {
      return null;
    }
  }

  Future<bool> createPost(Post post) async {
    try {
      await apiclient.post(APIendPonts.createPost,
          data: post.toMap(), isTokenNeeded: true);

      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> addlike() async {
  //   try {
  //     final List<Post> post =
  //         await apiclient.get<List<Post>>(APIendPonts.getAllPosts);

  //     return post;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
