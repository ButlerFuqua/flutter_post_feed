import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByAuthors extends StatefulWidget {
  const SortByAuthors({super.key});

  @override
  State<SortByAuthors> createState() => _SortByAuthorsState();
}

class _SortByAuthorsState extends State<SortByAuthors> {
  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    void handlePressed() {
      if (postState.sortBy == SortPostsBy.authorDesc) {
        return postState.sortPostsBy(SortPostsBy.none);
      }
      if (postState.sortBy != SortPostsBy.authorAsc) {
        return postState.sortPostsBy(SortPostsBy.authorAsc);
      }
      if (postState.sortBy == SortPostsBy.authorAsc) {
        return postState.sortPostsBy(SortPostsBy.authorDesc);
      }
      postState.sortPostsBy(SortPostsBy.none);
    }

    String getButtonTextFromSortState() {
      if (postState.sortBy == SortPostsBy.authorDesc) {
        return 'Unsort by author';
      }
      if (postState.sortBy != SortPostsBy.authorAsc) {
        return 'Sort by author First';
      }
      if (postState.sortBy == SortPostsBy.authorAsc) {
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
