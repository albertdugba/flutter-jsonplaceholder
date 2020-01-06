import 'package:flutter/material.dart';
import 'package:flutter_api_db/model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    http.Response res = await http.get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<void> deletePost(int id) async {
    http.Response response = await http.delete('$postsURL/$id');
    if (response.statusCode == 200) {
      final snackBar = Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Deleting post'),
      ));

      return snackBar;
    } else
      throw Exception('Failed to delete post');
  }
}
