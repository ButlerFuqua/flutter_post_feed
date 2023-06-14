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
    var _likedIds = [...widget.likedIds];
    bool _userLikedThis = _likedIds.contains(userState.currentUser.id);
    getColor() {
      return _userLikedThis
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary;
    }

    void handlePressed() {
      int currentUserId = userState.currentUser.id;

      PostClient.toggleLikePost(
        hasLiked: _userLikedThis,
        postId: widget.postId,
        userId: currentUserId,
      );

      postState.toggleLikeFromPost(
          userId: currentUserId, postId: widget.postId);
    }

    return TextButton(
        onPressed: handlePressed,
        child: Text(
          'Like (${_likedIds.length})',
          style: TextStyle(color: getColor()),
        ));
  }
}
