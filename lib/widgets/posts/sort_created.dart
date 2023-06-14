import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByCreated extends StatefulWidget {
  @override
  State<SortByCreated> createState() => _SortByCreatedState();
}

class _SortByCreatedState extends State<SortByCreated> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.created_desc) {
        return postState.sortPostsBy(SortPostsBy.none);
      }
      if (postState.sortBy != SortPostsBy.created_asc) {
        return postState.sortPostsBy(SortPostsBy.created_asc);
      }
      if (postState.sortBy == SortPostsBy.created_asc) {
        return postState.sortPostsBy(SortPostsBy.created_desc);
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.created_desc) {
        return 'Unsort by Created';
      }
      if (postState.sortBy != SortPostsBy.created_asc) {
        return 'Sort by Created First';
      }
      if (postState.sortBy == SortPostsBy.created_asc) {
        return 'Sort by Created Last';
      }
      return 'Unsort by Created';
    }

    return TextButton(
      onPressed: handlePressed,
      child: Text(getButtonTextFromSortState()),
    );
  }
}
