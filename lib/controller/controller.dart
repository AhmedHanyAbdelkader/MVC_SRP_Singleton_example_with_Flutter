import 'package:mvc_example/network_layer/get_posts.dart';

class PostsController {
  PostsController._();
  static final postsController = PostsController._();


  var postsInstance = GetPosts.getPostsInstance;

     getPostsFromDataModel() async {
    var posts = await postsInstance.getPosts();
    return posts;
  }
}

