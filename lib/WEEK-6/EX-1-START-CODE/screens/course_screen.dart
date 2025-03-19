import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/course_provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.id});

  final String id;

  void _addScore(BuildContext context) async {
    final newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );
    
    if (newScore != null) {
      Provider.of<CourseProvider>(context, listen: false)
          .addScore(id, newScore);
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final course = courseProvider.getCourseFor(id);

    if (course == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Course Not Found')),
        body: const Center(child: Text('This course does not exist.')),
      );
    }

    final scores = course.scores;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => _addScore(context), icon: const Icon(Icons.add)),
        ],
      ),
      body: scores.isEmpty
          ? const Center(child: Text('No Scores added yet.'))
          : ListView.builder(
              itemCount: scores.length,
              itemBuilder: (ctx, index) {
                final score = scores[index];
                return ListTile(
                  title: Text(score.studentName),
                  trailing: Text(
                    score.studenScore.toString(),
                    style: TextStyle(
                      color: scoreColor(score.studenScore),
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
