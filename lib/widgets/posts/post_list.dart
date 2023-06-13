import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'post_thumbnail.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late ScrollController _scrollController;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(context) {
    var postState = context.watch<PostModel>();

    Future.delayed(Duration.zero, () {
      if (postState.posts.isEmpty) {
        postState.setPosts(PostClient.getPosts());
      }
    });

    void loadMorePosts() {
      setState(() {
        isLoading = true;
      });

      Timer(Duration(seconds: 2), () {
        List<Post> posts = PostClient.getPosts(
            idsToSkip: postState.posts.map((post) => post.id).toList());
        setState(() {
          hasMore = posts.length == PostClient.pageLimit;
        });
        print(posts.length);
        Future.delayed(Duration.zero, () {
          postState.setPosts([...postState.posts, ...posts]);
        });

        setState(() {
          isLoading = false;
        });
      });
    }

    Future<void> refresh() async {
      List<Post> posts = PostClient.getPosts();
      setState(() {
        postState.setPosts([...posts]);
        hasMore = posts.length == PostClient.pageLimit;
      });
    }

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.95 &&
          !isLoading) {
        if (hasMore) {
          loadMorePosts();
        }
      }
    });

    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      height: double.infinity,
      child: postState.posts.length > 0
          ? RefreshIndicator(
              onRefresh: refresh,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: postState.posts.length + (hasMore ? 1 : 0),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  if (index == postState.posts.length) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: const SizedBox(
                        width: 60,
                        height: 60,
                        child: FittedBox(child: CircularProgressIndicator()),
                      ),
                    );
                  }

                  return PostThumbnail(post: postState.posts[index]);
                },
              ),
            )
          : Center(child: Text('No posts yet')),
    );
  }
}
