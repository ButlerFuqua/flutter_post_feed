import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:flutter_post_feed/widgets/comments/comment_display.dart';
import 'package:flutter_post_feed/widgets/reactions/like_button.dart';
import 'package:provider/provider.dart';

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    this.post,
  });

  final post;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();
    var userState = context.watch<UserModel>();

    var post = postState.posts.firstWhere((post) => post.id == widget.post.id);

    bool userHasCommented = post.comments
        .map((comment) =>
            comment.user is User ? comment.user.id : comment.user['id'])
        .contains(userState.currentUser.id);

    const double paddingSize = 10;

    dynamic getCommentLabelTextColor() {
      return userHasCommented ? Colors.deepOrange : Colors.black;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LikeButton(
              postId: post.id,
              likedIds: post.reactions,
            ),
            Text(
              '${post.comments.length} Comments',
              style: TextStyle(color: getCommentLabelTextColor()),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(
          height: paddingSize,
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: post.comments.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: paddingSize * 2,
          ),
          itemBuilder: (context, index) {
            return CommentDisplay(
              comment: post.comments[index],
            );
          },
        ),
      ],
    );
  }
}
