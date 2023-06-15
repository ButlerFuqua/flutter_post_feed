import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByCreated extends StatefulWidget {
  const SortByCreated({super.key});

  @override
  State<SortByCreated> createState() => _SortByCreatedState();
}

class _SortByCreatedState extends State<SortByCreated> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.createdDesc) {
        return postState.sortPostsBy(SortPostsBy.none);
      }
      if (postState.sortBy != SortPostsBy.createdAsc) {
        return postState.sortPostsBy(SortPostsBy.createdAsc);
      }
      if (postState.sortBy == SortPostsBy.createdAsc) {
        return postState.sortPostsBy(SortPostsBy.createdDesc);
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.createdDesc) {
        return 'Unsort by Created';
      }
      if (postState.sortBy != SortPostsBy.createdAsc) {
        return 'Sort by Created First';
      }
      if (postState.sortBy == SortPostsBy.createdAsc) {
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
