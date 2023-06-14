import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';

enum SortPostsBy {
  none,
  most_liked,
  least_liked,
  created_asc,
  created_desc,
}

class PostModel extends ChangeNotifier {
  List<Post> _posts = [];

  var sortBy = SortPostsBy.created_asc;

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  void setPosts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  void sortPostsBy(var sortByValue) {
    sortBy = sortByValue;
    _posts = PostClient.getPosts(sortBy: sortByValue);
    notifyListeners();
  }
}
