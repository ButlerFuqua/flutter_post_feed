import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/fakeData/fakeUsers.dart';
import 'package:flutter_post_feed/utils/user_utils.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String imageUrl;

  List<Comment> comments = [];
}

class UserClient {
  static List<User> getAllUsers() {
    List<User> users = [];
    for (var i = 0; i < allUsers.length; i++) {
      var user = allUsers[i];
      users.add(convertUserMapToUser(user));
    }
    return users;
  }

  static getUserById(int id) {
    Map user = allUsers.firstWhere((userMap) => userMap['id'] == id);
    return convertUserMapToUser(user);
  }
}
