import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
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
    _comment = CommentClient.getCommentById(widget.comment.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();

    bool isCurrentsComment = _comment.user.id == userState.currentUser.id;

    const double paddingSize = 10;

    return FractionallySizedBox(
      widthFactor: 0.8,
      alignment: FractionalOffset.topLeft,
      child: Container(
        padding: const EdgeInsets.all(paddingSize),
        margin: const EdgeInsets.all(paddingSize),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserThumbnail(user: _comment.user),
            Text(_comment.body),
          ],
        ),
      ),
    );
    // return Container(
    //   // color: Theme.of(context).colorScheme.surface,
    //   color: Colors.blue,
    //   width: double.infinity,
    //   child: Column(
    //     children: [
    //       UserThumbnail(user: _comment.user),
    //       Text(_comment.body),
    //     ],
    //   ),
    // );
  }
}
