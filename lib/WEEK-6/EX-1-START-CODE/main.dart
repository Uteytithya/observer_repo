import 'package:flutter/material.dart';
import 'package:observer_repo/WEEK-6/EX-1-START-CODE/provider/course_provider.dart';
import 'package:provider/provider.dart';

import 'screens/course_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => CourseProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
      
        home: CourseListScreen(),
      ),
    );
  }
}
