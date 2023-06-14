import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByAuthors extends StatefulWidget {
  @override
  State<SortByAuthors> createState() => _SortByAuthorsState();
}

class _SortByAuthorsState extends State<SortByAuthors> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.author_desc) {
        return postState.sortPostsBy(SortPostsBy.none);
      }
      if (postState.sortBy != SortPostsBy.author_asc) {
        return postState.sortPostsBy(SortPostsBy.author_asc);
      }
      if (postState.sortBy == SortPostsBy.author_asc) {
        return postState.sortPostsBy(SortPostsBy.author_desc);
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.author_desc) {
        return 'Unsort by author';
      }
      if (postState.sortBy != SortPostsBy.author_asc) {
        return 'Sort by author First';
      }
      if (postState.sortBy == SortPostsBy.author_asc) {
        return 'Sort by author Last';
      }
      return 'Unsort by author';
    }

    return TextButton(
      onPressed: handlePressed,
      child: Text(getButtonTextFromSortState()),
    );
  }
}
