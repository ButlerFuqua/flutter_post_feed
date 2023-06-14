import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:flutter_post_feed/screens/post_read.dart';
import 'package:provider/provider.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key, this.commentIds, this.postId});

  final commentIds;
  final postId;

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();
    bool _userLikedThis = commentIds.contains(userState.currentUser.id);
    getColor() {
      return _userLikedThis
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
          'Comments (${commentIds.length})',
          style: TextStyle(
            color: getColor(),
          ),
        ));
  }
}
