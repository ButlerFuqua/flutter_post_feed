import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/fakeData/fakePosts.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';

class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.reactions,
    required this.imageUrl,
    required this.createdDate,
    required this.modifiedDate,
  });
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<int> reactions;
  final String imageUrl;
  final DateTime createdDate;
  final DateTime modifiedDate;

  var user;

  List<Comment> comments = [];
}

class PostClient {
  static int pageLimit = 10;

  static List<Post> getPosts(
      {var sortBy = SortPostsBy.none, searchInput = '', List<int>? idsToSkip}) {
    List<Post> posts =
        allPosts.map((postMap) => convertPostMapToPost(postMap)).toList();

    if (idsToSkip != null && idsToSkip.isNotEmpty) {
      posts = posts.where((post) => !idsToSkip.contains(post.id)).toList();
    }

    switch (sortBy) {
      case SortPostsBy.most_liked:
        posts.sort((a, b) => b.reactions.length.compareTo(a.reactions.length));
        break;
      case SortPostsBy.least_liked:
        posts.sort((a, b) => a.reactions.length.compareTo(b.reactions.length));
        break;
      case SortPostsBy.created_asc:
        posts.sort((a, b) => a.createdDate.compareTo(b.createdDate));
        break;
      case SortPostsBy.created_desc:
        posts.sort((a, b) => b.createdDate.compareTo(a.createdDate));
        break;
    }

    return posts.length <= PostClient.pageLimit
        ? posts
        : posts.sublist(0, PostClient.pageLimit);
  }
}
