import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/fakeData/fakePosts.dart';
import 'package:flutter_post_feed/models/post_model.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';

class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.reactions,
    required this.imageUrl,
    required this.createdDate,
    required this.modifiedDate,
  });
  final int id;
  final String title;
  final String body;
  final int userId;
  List reactions;
  final String imageUrl;
  final DateTime createdDate;
  final DateTime modifiedDate;

  var user;

  List<Comment> comments = [];
}

class PostClient {
  static int pageLimit = 10;
  static bool hasMore = true;

  static getAllPosts() {
    List<Post> posts =
        allPosts.map((postMap) => convertPostMapToPost(postMap)).toList();

    // Used so new likes persist when posts are fetched again by the fake API
    posts = populateReactionsFromState(posts);
    return posts;
  }

  static List<Post> getPosts({
    var sortBy = SortPostsBy.none,
    searchInput = '',
    List<int>? idsToSkip,
  }) {
    List<Post> posts = getAllPosts();

    if (idsToSkip != null && idsToSkip.isNotEmpty) {
      posts = posts.where((post) => !idsToSkip.contains(post.id)).toList();
    }

    posts = PostClient.sortPosts(posts, sortBy);
    posts = PostClient.filterByTitleAndDesc(posts, searchInput);

    posts = posts.length <= PostClient.pageLimit
        ? posts
        : posts.sublist(0, PostClient.pageLimit);

    PostClient.hasMore = posts.length == PostClient.pageLimit;

    return posts;
  }

  static Post getPostById(int postId) {
    return getAllPosts().firstWhere((post) => post.id == postId);
  }

  static List<Post> sortPosts(List<Post> unsortedPosts, var sortBy) {
    if (sortBy == SortPostsBy.none) {
      return unsortedPosts;
    }
    List<Post> posts = List<Post>.from(unsortedPosts);
    switch (sortBy) {
      case SortPostsBy.mostLiked:
        posts.sort((a, b) => b.reactions.length.compareTo(a.reactions.length));
        break;
      case SortPostsBy.leastLiked:
        posts.sort((a, b) => a.reactions.length.compareTo(b.reactions.length));
        break;
      case SortPostsBy.oldestFirst:
        posts.sort((a, b) => a.createdDate.compareTo(b.createdDate));
        break;
      case SortPostsBy.newestFirst:
        posts.sort((a, b) => b.createdDate.compareTo(a.createdDate));
        break;
      case SortPostsBy.authorAsc:
        posts.sort((a, b) => a.user.username.compareTo(b.user.username));
        break;
      case SortPostsBy.authorDesc:
        posts.sort((a, b) => b.user.username.compareTo(a.user.username));
        break;
    }
    return posts;
  }

  static List<Post> filterByTitleAndDesc(List<Post> posts, String searchInput) {
    String criteria = searchInput.trim().toLowerCase();
    if (criteria == '') {
      return posts;
    }
    return posts
        .where((post) =>
            post.title.toLowerCase().contains(criteria) ||
            post.body.toLowerCase().contains(criteria))
        .toList();
  }

  static toggleLikePost({userId, postId, hasLiked}) {
    print(
        '${hasLiked ? "REMOVE" : "ADD"} LIKE FROM DB for user $userId on post $postId');
  }
}
