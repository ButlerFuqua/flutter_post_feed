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
      if (postState.sortBy != SortPostsBy.newestFirst) {
        return postState.sortPostsBy(SortPostsBy.newestFirst);
      }
      return postState.sortPostsBy(SortPostsBy.oldestFirst);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy != SortPostsBy.newestFirst) {
        return 'Sort by Newest';
      }
      return 'Sort by Oldest';
    }

    return TextButton(
      onPressed: handlePressed,
      child: Text(getButtonTextFromSortState()),
    );
  }
}
