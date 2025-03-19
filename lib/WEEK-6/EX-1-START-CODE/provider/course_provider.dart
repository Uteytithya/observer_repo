import 'package:flutter/material.dart';
import 'package:observer_repo/WEEK-6/EX-1-START-CODE/models/course.dart';
import 'package:observer_repo/WEEK-6/EX-1-START-CODE/repository/courses_mock_repository.dart';

class CourseProvider extends ChangeNotifier {

  CoursesMockRepository repo = CoursesMockRepository();

  List<Course> getCourses() {
    return repo.getCourses();
  }

  Course getCourseFor(String courseId){
    List<Course> courses = repo.getCourses();
    for (var i = 0; i < courses.length; i++) {
      if (courseId == courses[i].id) {
        return courses[i];
      }
    }
    throw new Exception("Course not found");
  }

  void addScore(String courseId, CourseScore score){
    Course course = getCourseFor(courseId);
    course.addScore(score);
    notifyListeners();
  }
}