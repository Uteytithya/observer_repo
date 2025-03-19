import 'package:observer_repo/WEEK-6/EX-1-START-CODE/models/course.dart';
import 'package:observer_repo/WEEK-6/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesMockRepository extends CourseRepository {
  
  Course flutter = Course(id: "1", name: "Flutter");
  Course gameDev = Course(id: "2", name: "Game Development");
  
  @override
  void addScore(Course course, CourseScore score) {
    course.scores.add(score);
  }

  @override
  List<Course> getCourses() {
    return [flutter, gameDev];
  }

}