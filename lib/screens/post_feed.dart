import 'package:flutter/material.dart';
import 'package:flutter_post_feed/widgets/posts/post_list.dart';
import 'package:flutter_post_feed/widgets/posts/search_bar.dart';
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PostList(),
      drawer: Drawer(
          child: ListView(
        children: [
          PostSearchBar(),
          SortByLikes(),
        ],
      )),
    );
  }
}
