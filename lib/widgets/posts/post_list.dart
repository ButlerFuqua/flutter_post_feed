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
  // todo This should come from the API response.
  // final _total = 100;
  bool isLoading = false;
  bool hasMore = true;

  // List<Post> _allPosts = [];
  List<Post> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _filteredPosts = PostClient.getPosts();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(context) {
    // var postState = context.watch<PostModel>();

    // postState.setFilteredPosts(_allPosts);

    void loadMorePosts() {
      setState(() {
        isLoading = true;
      });

      Timer(Duration(seconds: 2), () {
        List<Post> posts = PostClient.getPosts(
            idsToSkip: _filteredPosts.map((post) => post.id).toList());
        print(posts.length);
        setState(() {
          _filteredPosts = [..._filteredPosts, ...posts];
          hasMore = posts.length == PostClient.pageLimit;
        });

        setState(() {
          isLoading = false;
        });
      });
    }

    Future<void> refresh() async {
      List<Post> posts = PostClient.getPosts();
      setState(() {
        _filteredPosts = [...posts];
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
      child: _filteredPosts.length > 0
          ? RefreshIndicator(
              onRefresh: refresh,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: _filteredPosts.length + (hasMore ? 1 : 0),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  if (index == _filteredPosts.length) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: const SizedBox(
                        width: 60,
                        height: 60,
                        child: FittedBox(child: CircularProgressIndicator()),
                      ),
                    );
                  }

                  return PostThumbnail(post: _filteredPosts[index]);
                },
              ),
            )
          : Center(child: Text('No posts yet')),
    );
  }
}
