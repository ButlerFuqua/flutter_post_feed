import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostExcerpt extends StatelessWidget {
  const PostExcerpt(
      {super.key, this.excerpt, this.showPostPage, this.showReadMore});

  final excerpt;
  final showPostPage;
  final showReadMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      // child: Text(postExcerpt),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: excerpt, style: const TextStyle(color: Colors.black)),
            showReadMore
                ? TextSpan(
                    text: ' Read More',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = showPostPage)
                : const TextSpan(text: ''),
          ],
        ),
      ),
    );
  }
}
