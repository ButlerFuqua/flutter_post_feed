import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/fakeData/fakePosts.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';

class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.reactions,
    required this.imageUrl,
  });
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<int> reactions;
  final String imageUrl;

  var user;

  List<Comment> comments = [];
}

class PostClient {
  static int pageLimit = 10;

  static List<Post> getPosts({searchInput = '', List<int>? idsToSkip}) {
    List<Post> posts =
        allPosts.map((postMap) => convertPostMapToPost(postMap)).toList();

    if (idsToSkip != null && idsToSkip.isNotEmpty) {
      posts = posts.where((post) => !idsToSkip.contains(post.id)).toList();
    }

    return posts.length <= PostClient.pageLimit
        ? posts
        : posts.sublist(0, PostClient.pageLimit);
  }
}
