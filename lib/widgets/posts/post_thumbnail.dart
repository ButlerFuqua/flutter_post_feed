import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/clients/user_client.dart';

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

    // TODO move this to utility methods
    String getPostDescription(String desc) {
      if (desc.length <= maxDescriptionLength) {
        return desc;
      }
      return '${desc.substring(0, maxDescriptionLength)}...';
    }

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
              children: [
                widget.post.user?.imageUrl != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.post.user?.imageUrl),
                      )
                    : Text('Loading'),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.post.user?.username ?? 'Loading...',
                ),
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
                    child: Text(
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
