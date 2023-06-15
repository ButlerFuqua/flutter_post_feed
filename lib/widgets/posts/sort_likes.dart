import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByLikes extends StatefulWidget {
  const SortByLikes({super.key});

  @override
  State<SortByLikes> createState() => _SortByLikesState();
}

class _SortByLikesState extends State<SortByLikes> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.leastLiked) {
        postState.sortPostsBy(SortPostsBy.none);
        return;
      }
      if (postState.sortBy != SortPostsBy.mostLiked) {
        postState.sortPostsBy(SortPostsBy.mostLiked);
        return;
      }
      if (postState.sortBy == SortPostsBy.mostLiked) {
        postState.sortPostsBy(SortPostsBy.leastLiked);
        return;
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.leastLiked) {
        return 'Unsort by likes';
      }
      if (postState.sortBy != SortPostsBy.mostLiked) {
        return 'Sort by Most Liked';
      }
      if (postState.sortBy == SortPostsBy.mostLiked) {
        return 'Sort by Least Liked';
      }
      return 'Sort by Most Liked';
    }

    return TextButton(
      onPressed: handlePressed,
      child: Text(getButtonTextFromSortState()),
    );
  }
}
