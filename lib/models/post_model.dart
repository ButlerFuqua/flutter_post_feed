import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/fakeData/fakeComments.dart';

enum SortPostsBy {
  none,
  mostLiked,
  leastLiked,
  oldestFirst,
  newestFirst,
  authorAsc,
  authorDesc,
}

class PostModel extends ChangeNotifier {
  List<Post> _posts = [];

  var sortBy = SortPostsBy.newestFirst;
  String searchInput = '';
  static Map likedStateMap = {};
  static Map newCommentsMap = {};

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  void setPosts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  void sortPostsBy(var sortByValue) {
    sortBy = sortByValue;
    _updatePostsWithFilters();
    notifyListeners();
  }

  void searchPostsBy(String criteria) {
    searchInput = criteria;
    _updatePostsWithFilters();
    notifyListeners();
  }

  void _updatePostsWithFilters() {
    _posts = PostClient.getPosts(
        searchInput: searchInput.trim().toLowerCase(), sortBy: sortBy);
  }

  void toggleLikeFromPost({userId, postId}) {
    Post post =
        _posts[_posts.indexOf(_posts.firstWhere((post) => post.id == postId))];
    if (post.reactions.contains(userId)) {
      post.reactions.remove(userId);
      if (likedStateMap[postId] != null) {
        likedStateMap[postId].remove(userId);
      }
    } else {
      post.reactions.add(userId);
      likedStateMap[postId] = likedStateMap[postId] != null
          ? [...likedStateMap[postId], userId]
          : [userId];
    }
    notifyListeners();
  }

  void addCommentToPost(Map commentMap) {
    Comment newComment = Comment(
      id: allComments.length + 1,
      body: commentMap['body'],
      postId: commentMap['postId'],
      user: commentMap['user'],
    );
    _posts[_posts
            .indexOf(_posts.firstWhere((post) => post.id == newComment.postId))]
        .comments
        .add(newComment);

    int postId = newComment.postId;
    newCommentsMap[postId] = newCommentsMap[postId] != null
        ? [...newCommentsMap[postId], newComment]
        : [newComment];

    notifyListeners();
  }
}
