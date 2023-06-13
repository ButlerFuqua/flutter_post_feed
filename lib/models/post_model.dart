import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';

class PostModel extends ChangeNotifier {
  List<Post> _posts = [];

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  void setPosts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }
}
