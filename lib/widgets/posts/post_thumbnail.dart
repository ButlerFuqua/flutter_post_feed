import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';
import 'package:flutter_post_feed/utils/string_utils.dart';
import 'package:intl/intl.dart';

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
    final maxDescriptionLength = 150;

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
    );

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
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.post.user?.imageUrl),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.post.user?.username ?? 'Loading...',
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(getDisplayDate(widget.post.createdDate)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(paddingSize),
            child: Text(
              // TODO remove id here
              '${widget.post.id} $postTitle',
              style: titleStyle,
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
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Like (${widget.post.reactions.length})',
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View Post',
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Comments (${widget.post.comments.length})',
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
