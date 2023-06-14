import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByLikes extends StatefulWidget {
  @override
  State<SortByLikes> createState() => _SortByLikesState();
}

class _SortByLikesState extends State<SortByLikes> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.least_liked) {
        postState.sortPostsBy(SortPostsBy.none);
        return;
      }
      if (postState.sortBy != SortPostsBy.most_liked) {
        postState.sortPostsBy(SortPostsBy.most_liked);
        return;
      }
      if (postState.sortBy == SortPostsBy.most_liked) {
        postState.sortPostsBy(SortPostsBy.least_liked);
        return;
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.least_liked) {
        return 'Unsort by likes';
      }
      if (postState.sortBy != SortPostsBy.most_liked) {
        return 'Sort by Most Liked';
      }
      if (postState.sortBy == SortPostsBy.most_liked) {
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
