import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:flutter_post_feed/screens/post_read.dart';
import 'package:provider/provider.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key, this.comments, this.postId});

  final comments;
  final postId;

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();
    bool userHasCommented = comments
        .map((comment) =>
            (comment.user is User ? comment.user.id : comment.user['id']))
        .contains(userState.currentUser.id);

    getColor() {
      return userHasCommented
          ? Colors.deepOrange
          : Theme.of(context).colorScheme.primary;
    }

    void handlePressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostRead(
            postId: postId,
          ),
        ),
      );
    }

    return TextButton(
        onPressed: handlePressed,
        child: Text(
          'Comments (${comments.length})',
          style: TextStyle(
            color: getColor(),
          ),
        ));
  }
}
