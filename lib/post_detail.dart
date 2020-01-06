import 'package:flutter/material.dart';

import 'model/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details Page'),
      ),
    );
  }
}
