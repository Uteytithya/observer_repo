import 'package:flutter/material.dart';
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/repository/http_posts_repository.dart';
import 'package:observer_repo/WEEK-6/EX-2-START-CODE/repository/mock_posts_repository.dart';
import 'repository/post_repository.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  PostRepository postRepo = MockPostRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: postRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
