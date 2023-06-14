import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:provider/provider.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key, this.commentIds});

  final commentIds;

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();
    bool _userLikedThis = commentIds.contains(userState.currentUser.id);
    getColor() {
      return _userLikedThis
          ? Colors.deepOrange
          : Theme.of(context).colorScheme.primary;
    }

    return TextButton(
        onPressed: () {},
        child: Text(
          'Comments (${commentIds.length})',
          style: TextStyle(
            color: getColor(),
          ),
        ));
  }
}
