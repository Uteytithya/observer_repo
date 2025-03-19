import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/course_provider.dart';
import '../models/course.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  void _editCourse(BuildContext context, Course course) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => CourseScreen(id: course.id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) {
          final courses = courseProvider.getCourses();

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (ctx, index) {
              final course = courses[index];

              return Dismissible(
                key: Key(course.id),
                child: CourseTile(
                  course: course,
                  onEdit: () => _editCourse(context, course),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: onEdit,
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.hasScore
                    ? "${course.scores.length} scores"
                    : "No score"),
                if (course.hasScore)
                  Text("Average: ${course.average.toStringAsFixed(1)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
