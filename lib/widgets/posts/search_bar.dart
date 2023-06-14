import 'package:flutter/material.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class PostSearchBar extends StatefulWidget {
  @override
  State<PostSearchBar> createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postState = context.watch<PostModel>();

    if (_controller.text != postState.searchInput) {
      _controller.text = postState.searchInput ?? '';
    }

    void handleSearchInput(String input) {
      postState.searchPostsBy(input);
      setState(() {});
    }

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search titles and descriptions',
          ),
          onChanged: handleSearchInput,
        ),
        Text(postState.searchInput),
      ],
    );
  }
}
