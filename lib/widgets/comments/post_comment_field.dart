import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:provider/provider.dart';

class SubmitCommentField extends StatefulWidget {
  const SubmitCommentField({super.key, this.postId});

  final postId;

  @override
  State<SubmitCommentField> createState() => _SubmitCommentFieldState();
}

class _SubmitCommentFieldState extends State<SubmitCommentField> {
  final TextEditingController _controller = TextEditingController();

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
    var userState = context.watch<UserModel>();
    var postState = context.watch<PostModel>();

    void handleSubmit() {
      Map commentMap = {
        'body': _controller.text.trim(),
        'postId': widget.postId,
        'user': userState.currentUser,
      };

      // Send new comment to API
      CommentClient.addComment(commentMap);

      // Add to Provider state
      // This is so the comment will reload again when fetching
      postState.addCommentToPost(commentMap);

      // setState(() {
      _controller.text = '';
      // });

      // Update local state with new comment (or refresh from API)
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Post a comment!',
              ),
            ),
          ),
          TextButton(
            child: const Text('Submit'),
            onPressed: handleSubmit,
          ),
        ],
      ),
    );
  }
}
