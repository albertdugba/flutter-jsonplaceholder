import 'package:flutter/material.dart';
import 'package:flutter_api_db/service/http_service.dart';

import 'model/post.dart';
import 'post_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map((Post post) => Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                          Colors.grey[900],
                          Colors.black87,
                          Colors.black45
                        ])),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(post.title),
                              subtitle: Text('ID :${post.userId}'),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PostDetail(post: post),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
