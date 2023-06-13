import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/fakeData/fakeComments.dart';

class Comment {
  Comment({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });
  final int id;
  final String body;
  final int postId;
  final Map user;
}

class CommentClient {
  static List<Comment> getAllComments({limit = 10, skip = 0}) {
    List<Comment> comments = [];
    for (var i = 0; i < allComments.length; i++) {
      var comment = allComments[i];
      //
      int commentId = comment['id'];
      comments.add(Comment(
        id: commentId,
        body: comment['body'],
        postId: comment['postId'],
        user: comment['user'],
      ));
    }

    return comments;
  }
}
