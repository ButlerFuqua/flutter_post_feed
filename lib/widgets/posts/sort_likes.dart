import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/fakeData/fakePosts.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:provider/provider.dart';

class SortByLikes extends StatefulWidget {
  @override
  State<SortByLikes> createState() => _SortByLikesState();
}

class _SortByLikesState extends State<SortByLikes> {
  @override
  Widget build(BuildContext context) {
    // var postState = context.watch<PostModel>();

    void handlePressed() {
      print('Pressed');
    }

    return TextButton(
      onPressed: handlePressed,
      child: Text('Sort by Likes'),
    );
  }
}
