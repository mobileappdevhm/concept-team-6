import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/Course.dart';

class DataBaseMock implements DataBaseInterface {

  static const String RESOURCE = "assets/courses.json";

  List<Course> _courses;

  Future<List<Course>> _future;

  DataBaseMock() {
    _future = _loadAsset().then((str) {
      _initCourses(str);
    });
  }

  Future<String> _loadAsset() async {
    return await rootBundle.loadString(RESOURCE);
  }

  void _initCourses(String str) {
    _courses = <Course>[];

    Map<String, dynamic> decodedJson = json.decode(str);

    var jsonCourseList = decodedJson["courses"];

    if (jsonCourseList != null) {
      for (var item in jsonCourseList) {
        Course c = new Course();

        c.title = item["title"];
        c.lecturer = item["lecturer"];
        c.sws = item["sws"];
        c.ects = item["ects"];
        c.usCredits = item["usCredits"];
        c.category = item["category"];
        c.level = item["level"];

        var description = item["description"];

        if (description != null) {
          CourseDescription cd = new CourseDescription();

          cd.title = description["title"];
          cd.department = description["department"];
          cd.objective = description["objective"];
          cd.prerequisites = description["prerequisites"];
          cd.recommendedReading = description["recommendedReading"];
          cd.teachingMethods = description["teachingMethods"];
          cd.assessmentMethods = description["assessmentMethods"];
          cd.language = description["language"];
          cd.lecturerNames = description["lecturerNames"];
          cd.email = description["email"];
          cd.link = description["link"];
          cd.courseContent = description["courseContent"];
          cd.remarks = description["remarks"];

          c.description = cd;
        }

        _courses.add(c);
      }
    }
  }

  @override
  Future<List<Course>> getCourses() async {
    if (_courses == null) {
      await _future;
    }

    return _courses;
  }

}
