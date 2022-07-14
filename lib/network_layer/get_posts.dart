import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:mvc_example/controller/get_uri.dart';
import 'package:mvc_example/model/post_model.dart';

class GetPosts{
  GetPosts._();
  static final getPostsInstance = GetPosts._();

  static const String key = "posts";

  var urlInstance = GetUrl.getUrlInstance;
  List<Post>? postsList = [];

   getPosts()async{
    var uri = urlInstance.getUrl(key);
    Response? response =await http.get(uri);
    if(response.statusCode == 200) {
      List jsn = json.decode(response.body);
      jsn.forEach((element) {
        postsList!.add(Post.fromJson(element));
      });
    } else {
      response.statusCode;
    }
    return postsList;
  }
}