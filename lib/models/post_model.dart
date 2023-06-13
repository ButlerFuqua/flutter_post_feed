import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';

class PostModel extends ChangeNotifier {
  List<Post> _filteredPosts = [];

  UnmodifiableListView<Post> get filteredPosts =>
      UnmodifiableListView(_filteredPosts);

  void setFilteredPosts(List<Post> posts) {
    _filteredPosts = posts;
    notifyListeners();
  }
}
