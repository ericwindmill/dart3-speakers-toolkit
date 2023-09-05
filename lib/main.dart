// ignore_for_file: prefer_const_constructors
import 'package:dart_3_speakers_toolkit/data.dart';
import 'package:dart_3_speakers_toolkit/user.dart';
import 'package:flutter/material.dart';

import 'author_widgets.dart';
import 'post.dart';
import 'post_widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Post> _allPosts = [];

  @override
  initState() {
    for (var postJson in json) {
      _allPosts.add(fromJson(postJson));
    }
    super.initState();
  }

  (Widget, Widget) getPostWidgets(Post post) {
    return switch (post) {
      TextPost(:NormalUser user) => (TextPostWidget(post), AuthorWidget(user)),
      TextPost(:AdminUser user) => (TextPostWidget(post), AdminWidget(user)),
      TextPost(:PaidUser user) => (TextPostWidget(post), BlueCheckmarkWidget(user)),
      ImagePost(:NormalUser user) => (ImagePostWidget(post), AuthorWidget(user)),
      ImagePost(:AdminUser user) => (ImagePostWidget(post), AdminWidget(user)),
      ImagePost(:PaidUser user) => (ImagePostWidget(post), BlueCheckmarkWidget(user)),
      VideoPost(:NormalUser user) => (VideoPostWidget(post), AuthorWidget(user)),
      VideoPost(:AdminUser user) => (VideoPostWidget(post), AdminWidget(user)),
      VideoPost(:PaidUser user) => (VideoPostWidget(post), BlueCheckmarkWidget(user)),
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _allPosts.length,
      itemBuilder: (context, idx) {
        final (postWidget, authorWidget) = getPostWidgets(_allPosts[idx]);
        return Column(
          children: [
            postWidget,
            authorWidget,
          ],
        );
      },
    );
  }
}
