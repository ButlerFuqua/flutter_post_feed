import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:flutter_post_feed/widgets/common/user_thumbnail.dart';
import 'package:provider/provider.dart';

class CommentDisplay extends StatefulWidget {
  const CommentDisplay({super.key, this.comment});

  final comment;

  @override
  State<CommentDisplay> createState() => _CommentDisplayState();
}

class _CommentDisplayState extends State<CommentDisplay> {
  late Comment _comment;
  @override
  void initState() {
    super.initState();
    // _comment = CommentClient.getCommentById(widget.comment.id);
    _comment = widget.comment;
    if (_comment.user is User) {
      _comment.user = UserClient.getUserById(_comment.user.id);
    } else {
      _comment.user = UserClient.getUserById(_comment.user['id']);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();

    const double paddingSize = 10;

    bool isCurrentsComment = _comment.user.id == userState.currentUser.id;

    dynamic getCommentAlignment() {
      return !isCurrentsComment
          ? FractionalOffset.topLeft
          : FractionalOffset.topRight;
    }

    dynamic getContentAlignment() {
      return !isCurrentsComment
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end;
    }

    return FractionallySizedBox(
      widthFactor: 0.8,
      alignment: getCommentAlignment(),
      child: Container(
        padding: const EdgeInsets.all(paddingSize),
        margin: const EdgeInsets.all(paddingSize),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        child: Column(
          crossAxisAlignment: getContentAlignment(),
          children: [
            UserThumbnail(user: _comment.user),
            const SizedBox(
              height: paddingSize / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(paddingSize),
              child: Text(_comment.body),
            ),
          ],
        ),
      ),
    );
  }
}
