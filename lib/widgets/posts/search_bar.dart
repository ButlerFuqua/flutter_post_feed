import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/fakeData/fakePosts.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class PostSearchBar extends StatefulWidget {
  @override
  State<PostSearchBar> createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  @override
  Widget build(BuildContext context) {
    // var postState = context.watch<PostModel>();

    void handleSearchInput(String text) {
      print(text);
    }

    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search titles and descriptions',
      ),
      onChanged: handleSearchInput,
    );
  }
}
