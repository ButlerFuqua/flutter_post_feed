import 'package:flutter_post_feed/clients/comment_client.dart';
import 'package:flutter_post_feed/fakeData/fakeUsers.dart';

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
  static List<User> getAllUsers({limit = '10', skip = '0'}) {
    List<User> users = [];
    for (var i = 0; i < allUsers.length; i++) {
      var user = allUsers[i];
      int userId = user['id'];
      users.add(User(
        id: userId,
        email: user['email'],
        username: user['username'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        imageUrl: user['image'],
      ));
    }
    return users;
  }

  static getUserById(int id) {
    // var response = await http.get(Uri.https('dummyjson.com', '/users/$id'));
    // var user = json.decode(response.body);
    // if (user == null || user?['id'] == null) {
    //   return;
    // }
    Map user = allUsers.firstWhere((userMap) => userMap['id'] == id);
    return User(
      id: user['id'],
      email: user['email'],
      username: user['username'],
      firstName: user['firstName'],
      lastName: user['lastName'],
      imageUrl: user['image'],
    );
  }
}
