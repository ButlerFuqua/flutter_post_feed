import 'package:flutter_post_feed/clients/post_client.dart';
import 'package:flutter_post_feed/utils/post_utils.dart';
import 'package:test/test.dart';

int mockPostId = 1;

Map mockPostMap = {
  "id": mockPostId,
  "title": "His mother had always taught him",
  "body":
      "His mother had always taught him not to ever think of himself as better than others. He'd tried to live by this motto. He never looked down on those who were less fortunate or who had less money than him. But the stupidity of the group of people he was talking to made him change his mind.",
  "userId": 9,
  "reactions": 4,
};

Post mockPost = Post(
  id: mockPostMap['id'],
  title: mockPostMap['title'],
  body: mockPostMap['body'],
  userId: mockPostMap['userId'],
  reactions: [1, 2, 3, 4],
  imageUrl: "https://picsum.photos/id/$mockPostId/200",
  createdDate: DateTime(2023),
  modifiedDate: DateTime(2023),
);

void main() {
  group('#getPostDescription', () {
    test('Returns a string based on the maxDescriptionLength', () {
      String description = getPostDescription(mockPost.body);
      // + 3 to account for the '...'
      expect(description.length, maxDescriptionLength + 3);
    });
    test('Returns the same string if it is less than maxDescriptionLength', () {
      String short = 'a';
      String description = getPostDescription(short);
      expect(description, short);
    });
  });

  group('#convertPostMapToPost', () {
    test('Returns an instantiation of Post from a map', () {
      var post = convertPostMapToPost(mockPostMap);
      expect(post is Post, true);
    });
  });
}
