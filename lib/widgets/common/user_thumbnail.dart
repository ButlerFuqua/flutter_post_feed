import 'package:flutter/material.dart';

class UserThumbnail extends StatelessWidget {
  const UserThumbnail({super.key, this.user});

  final user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.imageUrl),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          user.username,
        ),
      ],
    );
  }
}
