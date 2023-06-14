import 'package:flutter_post_feed/clients/user_client.dart';

User convertUserMapToUser(Map userMap) {
  return User(
    id: userMap['id'],
    email: userMap['email'],
    username: userMap['username'],
    firstName: userMap['firstName'],
    lastName: userMap['lastName'],
    imageUrl: userMap['image'],
  );
}
