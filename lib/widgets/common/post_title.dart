import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({super.key, this.titleText});

  final titleText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
    );
    return Text(
      titleText,
      style: titleStyle,
    );
  }
}
