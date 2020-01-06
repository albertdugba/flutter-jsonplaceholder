import 'package:flutter/material.dart';
import 'package:flutter_api_db/posts.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(primaryColor: Colors.black, accentColor: Colors.blue),
      home: PostsPage(),
    );
  }
}
