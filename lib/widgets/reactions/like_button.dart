import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/models/user_model.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, this.likedIds, this.postId});

  final likedIds;
  final postId;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserModel>();
    var postState = context.watch<PostModel>();
    var likedIds = [...widget.likedIds];
    bool userLikedThis = likedIds.contains(userState.currentUser.id);
    getColor() {
      return userLikedThis
          ? Colors.deepOrange
          : Theme.of(context).colorScheme.primary;
    }

    void handlePressed() {
      int currentUserId = userState.currentUser.id;

      PostClient.toggleLikePost(
        hasLiked: userLikedThis,
        postId: widget.postId,
        userId: currentUserId,
      );

      postState.toggleLikeFromPost(
          userId: currentUserId, postId: widget.postId);
    }

    return TextButton(
        onPressed: handlePressed,
        child: Text(
          'Like (${likedIds.length})',
          style: TextStyle(
            color: getColor(),
          ),
        ));
  }
}
