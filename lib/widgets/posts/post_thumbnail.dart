import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';
import 'package:flutter_post_feed/utils/string_utils.dart';
import 'package:flutter_post_feed/widgets/comments/comment_button.dart';
import 'package:flutter_post_feed/widgets/common/post_title.dart';
import 'package:flutter_post_feed/widgets/common/user_thumbnail.dart';
import 'package:flutter_post_feed/widgets/posts/reactions/like_button.dart';

class PostThumbnail extends StatefulWidget {
  const PostThumbnail({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<PostThumbnail> createState() => _PostThumbnailState();
}

class _PostThumbnailState extends State<PostThumbnail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(context) {
    var postTitle = widget.post.title;
    var postBody = widget.post.body;
    const double paddingSize = 10;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(paddingSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserThumbnail(
                  user: widget.post.user,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(getDisplayDate(widget.post.createdDate)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(paddingSize),
            child: PostTitle(
              titleText: postTitle,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(paddingSize),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
            ),
            child: Text(getPostDescription(postBody)),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(paddingSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(
                  likedIds: widget.post.reactions,
                  postId: widget.post.id,
                ),
                CommentButton(
                  comments: widget.post.comments,
                  postId: widget.post.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
