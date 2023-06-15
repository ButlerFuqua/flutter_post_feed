import 'package:flutter/material.dart';
import 'package:flutter_post_feed/widgets/posts/post_list.dart';
import 'package:flutter_post_feed/widgets/posts/search_bar.dart';
import 'package:flutter_post_feed/widgets/posts/sort_author.dart';
import 'package:flutter_post_feed/widgets/posts/sort_created.dart';
import 'package:flutter_post_feed/widgets/posts/sort_likes.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({
    super.key,
  });
  final String title = 'Post Feed';

  static String routeName = 'post_feed';

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const PostList(),
      drawer: Drawer(
          child: ListView(
        children: [
          PostSearchBar(),
          const SortByLikes(),
          const SortByCreated(),
          const SortByAuthors(),
        ],
      )),
    );
  }
}
