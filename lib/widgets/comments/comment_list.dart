import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/widgets/comments/comment_display.dart';
import 'package:provider/provider.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key, this.post});

  final post;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late Post _post;
  late List<Comment> _comments;
  @override
  void initState() {
    super.initState();
    _post = widget.post;
    _comments = List<Comment>.from(_post.comments);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    var post = postState.posts.firstWhere((post) => post.id == widget.post.id);

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: post.comments.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        return CommentDisplay(
          comment: post.comments[index],
        );
      },
    );
  }
}
