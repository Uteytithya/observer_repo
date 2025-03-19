import 'package:observer_repo/WEEK-6/EX-1-START-CODE/models/course.dart';

abstract class CourseRepository{
  List<Course> getCourses();

  void addScore(Course course, CourseScore score);
}