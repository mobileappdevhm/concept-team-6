import 'dart:async';

import 'package:prototype/logic/Course.dart';
import 'package:prototype/logic/category.dart';
import 'package:prototype/logic/faculty.dart';

abstract class DataBaseInterface{

  Future<List<Course>> getCourses();

  Future<Map<int, Faculty>> getFaculties();

  Future<List<Category>> getCategories();

}