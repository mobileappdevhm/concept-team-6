import 'dart:async';

import 'package:prototype/logic/Course.dart';

abstract class DataBaseInterface{

  Future<List<Course>> getCourses();

}