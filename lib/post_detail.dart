import 'package:flutter/material.dart';
import 'package:flutter_api_db/service/http_service.dart';

import 'model/post.dart';

class PostDetail extends StatelessWidget {
  HttpService httpService = HttpService();
  final Post post;

  PostDetail({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.title.substring(1, 10)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deletePost(post.id);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text('Title'),
                        subtitle: Text(post.title),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Body'),
                        subtitle: Text(post.body),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('User ID'),
                        subtitle: Text(
                          post.userId.toString(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
