import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/Course.dart';
import 'package:prototype/logic/category.dart';
import 'package:prototype/logic/faculty.dart';

class DataBaseMock implements DataBaseInterface {
  static const String RESOURCE = "assets/courses.json";

  static const Map<int, Faculty> FACULTIES = const <int, Faculty>{
    1: const Faculty(1, "Architecture", const Color(0xFF014085)),
    2: const Faculty(2, "Civil Engineering", const Color(0xFF008db8)),
    3: const Faculty(3, "Mechanical, Automotive and Aeronautical Engineering", const Color(0xFF018bc9)),
    4: const Faculty(4, "Electrical Engineering and Information Technology", const Color(0xFF0198ab)),
    5: const Faculty(5, "Building Services Engineering, Paper and Packaging Technology and Print and Media Technology", const Color(0xFF016fb2)),
    6: const Faculty(6, "Applied Sciences and Mechatronics", const Color(0xFF04539d)),
    7: const Faculty(7, "Computer Science and Mathematics", const Color(0xFF029fd0)),
    8: const Faculty(8, "Geoinformatics", const Color(0xFF018a8a)),
    9: const Faculty(9, "Engineering and Management", const Color(0xFF018e62)),
    10: const Faculty(10, "Business Administration", const Color(0xFF028d7c)),
    11: const Faculty(11, "Applied Social Sciences", const Color(0xFFed7406)),
    12: const Faculty(12, "Design", const Color(0xFF0f3647)),
    13: const Faculty(13, "General and Interdisciplinary Studies", const Color(0xFFbf0179)),
    14: const Faculty(14, "Tourism", const Color(0xFFa41948))
  };

  static const List<Category> CATEGORIES = const <Category>[
    const Category(0, "Computer Sciences", const <int>[7]),
    const Category(1, "Mechatronics", const <int>[3]),
    const Category(2, "Electronics", const <int>[4]),
    const Category(3, "Economy", const <int>[10]),
    const Category(4, "Tourism", const <int>[14]),
    const Category(5, "Design", const <int>[12]),
    const Category(6, "Healthcare", const <int>[13])
  ];

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
        c.favourite = false;

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

  @override
  Future<Map<int, Faculty>> getFaculties() async {
    return FACULTIES;
  }

  @override
  Future<List<Category>> getCategories() async {
    return CATEGORIES;
  }

  @override
  void setFavourite(Course course, bool favourite){
    _courses[_courses.indexOf(course)].favourite = favourite;
  }
}
