import 'package:flutter_post_feed/clients/post_client.dart';

Post convertPostMapToPost(Map postMap) {
  int postId = postMap['id'];
  List<int> reactions = [];
  for (var i = 0; i < postMap['reactions']; i++) {
    reactions.add(i + 1);
  }
  Post post = Post(
      id: postId,
      title: postMap['title'],
      body: postMap['body'],
      userId: postMap['userId'],
      reactions: reactions,
      imageUrl: 'https://picsum.photos/id/$postId/200');
  // post.user = UserClient.getUserById(post.userId);
  // post.comments = CommentClient.getAllComments()
  //     .where((comment) => comment.postId == post.id)
  //     .toList();
  return post;
}
