import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/Course.dart';

class DataBaseMock implements DataBaseInterface {
  List<Course> _courses = new List<Course>();

  @override
  getCourses() {
    return _courses;
  }

  @override
  addCourse(Course course) {
    _courses.add(course);
  }

  @override
  removeCourse(num courseID) {
    _courses.remove(getCourse(courseID));
  }

  @override
  getCourse(num courseID) {
    for(int i; i < _courses.length; i++){
      if(_courses[i].getID() == courseID){
        return _courses[i];
      }
    }
  }
}
