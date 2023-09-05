import 'user.dart';

sealed class Post {
  final String id;
  final int likes;
  final User user;
  Post(this.id, this.likes, this.user);
}

class TextPost extends Post {
  final String postBody;
  TextPost(super.id, super.likes, super.user, this.postBody);
}

class ImagePost extends Post {
  final String imagePath;

  ImagePost(super.id, super.likes, super.user, this.imagePath);
}

class VideoPost extends Post {
  final String vodUrl;

  VideoPost(super.id, super.likes, super.user, this.vodUrl);
}

Post fromJson(json) {
  return switch (json) {
    {
      'id': String id,
      'type': 'text',
      'likes': int likes,
      'postBody': String postBody,
      'user': {
        'username': String username,
        'location': String location,
      },
    } =>
      TextPost(id, likes, AdminUser(username, location), postBody),
    {
      'id': String id,
      'type': 'image',
      'likes': int likes,
      'imagePath': String imagePath,
      'user': {
        'username': String username,
        'location': String location,
      },
    } =>
      TextPost(id, likes, AdminUser(username, location), imagePath),
    _ => throw const FormatException(''),
  };
}
