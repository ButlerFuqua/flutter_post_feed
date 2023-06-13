import 'package:flutter/material.dart';
import 'package:flutter_post_feed/screens/post_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Feed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: PostFeed.routeName,
      routes: <String, WidgetBuilder>{
        PostFeed.routeName: (_) => const PostFeed()
      },
    );
  }
}
