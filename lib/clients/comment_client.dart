import 'package:flutter_post_feed/clients/user_client.dart';
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
  var user;
}

class CommentClient {
  static List<Comment> getAllComments() {
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

  static getCommentById(int id) {
    Comment comment =
        getAllComments().firstWhere((comment) => comment.id == id);

    User user = UserClient.getUserById(comment.user['id']);
    comment.user = user;
    return comment;
  }

  static addComment(Map newComment) {
    print('Added to comment to post!');
  }
}
