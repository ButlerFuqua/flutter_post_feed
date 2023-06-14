import 'package:flutter/material.dart';
import 'package:flutter_post_feed/clients/user_client.dart';
import 'package:flutter_post_feed/fakeData/fakeUsers.dart';
import 'package:flutter_post_feed/utils/user_utils.dart';

// TODO get from auth
const int currentUserId = 100;

class UserModel extends ChangeNotifier {
  final User _currentUser = convertUserMapToUser(
      allUsers.firstWhere((user) => user['id'] == currentUserId));

  get currentUser => _currentUser;
}
