import 'package:dart_3_speakers_toolkit/user.dart';
import 'package:flutter/material.dart';

import 'post.dart';

class TextPostWidget extends StatefulWidget {
  const TextPostWidget(this.post, {super.key});

  final TextPost post;

  @override
  State<TextPostWidget> createState() => _TextPostWidgetState();
}

class _TextPostWidgetState extends State<TextPostWidget> {
  bool isHovered = false;
  bool isPressed = false;
  bool isActive = true;

  Color hoverColor = Colors.lightBlue;
  Color inactiveColor = Colors.grey;
  Color pressedColor = Colors.lightBlueAccent;
  Color activeColor = Colors.blue;

  Color buttonColor(
    User user,
    Post post,
    bool isActive,
    bool isPressed,
    bool isHovered,
  ) {
    final User postAuthor = post.user;
    var record = (isActive, user, isPressed, isHovered, postAuthor);
    return switch (record) {
      (false, _, _, _, _) => inactiveColor,
      (true, NormalUser _, _, _, _) => inactiveColor,
      (true, PaidUser _, _, _, AdminUser _) => inactiveColor,
      (true, PaidUser _, true, _, (NormalUser _ || PaidUser _)) => pressedColor,
      (true, PaidUser _, _, true, (NormalUser _ || PaidUser _)) => hoverColor,
      (true, PaidUser _, false, false, (NormalUser _ || PaidUser _)) => activeColor,
      (true, AdminUser _, true, _, _) => pressedColor,
      (true, AdminUser _, false, true, _) => hoverColor,
      (true, AdminUser _, false, false, _) => activeColor,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.post.postBody);
  }
}

// TODO: Image and Video widgets
class ImagePostWidget extends StatefulWidget {
  const ImagePostWidget(this.post, {super.key});

  final ImagePost post;

  @override
  State<ImagePostWidget> createState() => _ImagePostWidgetState();
}

class _ImagePostWidgetState extends State<ImagePostWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.post.imagePath);
  }
}

class VideoPostWidget extends StatefulWidget {
  const VideoPostWidget(this.post, {super.key});

  final VideoPost post;

  @override
  State<VideoPostWidget> createState() => _VideoPostWidgetState();
}

class _VideoPostWidgetState extends State<VideoPostWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('TODO: Video Player'),
    );
  }
}
