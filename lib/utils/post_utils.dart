import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/models/post_model.dart';

const maxDescriptionLength = 150;

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
    imageUrl: 'https://picsum.photos/id/$postId/200',
    createdDate: getDateFromPostId(postId),
    modifiedDate: getDateFromPostId(postId),
  );
  post.user = UserClient.getUserById(post.userId);
  post.comments = CommentClient.getAllComments()
      .where((comment) => comment.postId == post.id)
      .toList();
  return post;
}

String getPostDescription(String desc) {
  if (desc.length <= maxDescriptionLength) {
    return desc;
  }
  return '${desc.substring(0, maxDescriptionLength)}...';
}

DateTime getDateFromPostId(int postId) {
  return DateTime(postId + 1990);
}

List<Post> populateReactionsFromState(List<Post> posts) {
  Map likedStateMap = PostModel.likedStateMap;
  posts.forEach((post) {
    if (likedStateMap[post.id] != null && likedStateMap[post.id].length > 0) {
      post.reactions =
          [...post.reactions, ...likedStateMap[post.id]].toSet().toList();
    }
  });

  return posts;
}
