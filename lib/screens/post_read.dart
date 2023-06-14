import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/widgets/common/post_title.dart';
import 'package:flutter_post_feed/widgets/posts/post_list.dart';

class PostRead extends StatefulWidget {
  const PostRead({
    super.key,
    this.postId,
  });
  final postId;

  @override
  State<PostRead> createState() => _PostReadState();
}

class _PostReadState extends State<PostRead> {
  var _post;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      _post = PostClient.getPostById(widget.postId);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const paddingSize = 10.0;
    const separatedHeight = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('View post & Comments'),
      ),
      body: _post != null
          ? SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(paddingSize),
                  child: PostTitle(
                    titleText: _post.title,
                  ),
                ),
                const SizedBox(
                  height: separatedHeight,
                ),
                Padding(
                  padding: const EdgeInsets.all(paddingSize),
                  child: Text(_post.body),
                ),
                const SizedBox(
                  height: separatedHeight * 2,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 180,
                  itemBuilder: (context, index) {
                    return Text('Some text');
                  },
                ),
              ]),
            )
          : isLoading
              // TODO replace with Loader screen
              ? const Center(
                  child: Text('Loading'),
                )
              // TODO Replace with alert and actual error message
              : const Center(
                  child: Text('Error getting post'),
                ),
    );
  }
}
