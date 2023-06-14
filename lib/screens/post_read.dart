import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
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
  late Post _post;

  @override
  void initState() {
    super.initState();
    _post = PostClient.getPostById(widget.postId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _post != null
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Read post'),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  PostTitle(
                    titleText: _post.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _post.body,
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: Text(
              'Loading',
            ),
          );
  }
}
