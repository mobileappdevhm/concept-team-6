import 'package:prototype/logic/Course.dart';

abstract class DataBaseInterface{
  getCourses();
  addCourse(Course course);
  removeCourse(num courseID);
  getCourse(num courseID);
}