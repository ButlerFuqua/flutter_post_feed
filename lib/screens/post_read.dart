import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/widgets/comments/comment_list.dart';
import 'package:flutter_post_feed/widgets/comments/post_comment_field.dart';
import 'package:flutter_post_feed/widgets/common/post_title.dart';

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
    ScrollController scrollController = ScrollController();
    const paddingSize = 10.0;
    const separatedHeight = 20.0;

    var theme = Theme.of(context);

    void onCommentSubmit() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('View post & Comments'),
      ),
      body: _post != null
          ? SingleChildScrollView(
              controller: scrollController,
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
                  child: Text(
                    _post.body,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: separatedHeight * 2,
                ),
                CommentList(post: _post),
                const SizedBox(
                  height: separatedHeight * 3,
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
      bottomSheet: _post != null && !isLoading
          ? BottomAppBar(
              child: SubmitCommentField(
                postId: _post.id,
                onComplete: onCommentSubmit,
              ),
              // child: TextField(),
            )
          : const Text('Loading...'),
    );
  }
}
