/// count : 1
/// next : null
/// previous : null
/// results : [{"course":{"id":2,"name":"Algorithm","credit_hours":3,"Teachering_hours":3,"code":"COMP 201","description":"required : COMP212"},"course_instance":{"id":2,"semester":"Summer","year":2,"course":2,"teacher":2,"department":1}}]

class StudentCourses {
  StudentCourses({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  StudentCourses.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// course : {"id":2,"name":"Algorithm","credit_hours":3,"Teachering_hours":3,"code":"COMP 201","description":"required : COMP212"}
/// course_instance : {"id":2,"semester":"Summer","year":2,"course":2,"teacher":2,"department":1}

class Results {
  Results({
      this.course, 
      this.courseInstance,});

  Results.fromJson(dynamic json) {
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    courseInstance = json['course_instance'] != null ? CourseInstance.fromJson(json['course_instance']) : null;
  }
  Course? course;
  CourseInstance? courseInstance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (course != null) {
      map['course'] = course?.toJson();
    }
    if (courseInstance != null) {
      map['course_instance'] = courseInstance?.toJson();
    }
    return map;
  }

}

/// id : 2
/// semester : "Summer"
/// year : 2
/// course : 2
/// teacher : 2
/// department : 1

class CourseInstance {
  CourseInstance({
      this.id, 
      this.semester, 
      this.year, 
      this.course, 
      this.teacher, 
      this.department,});

  CourseInstance.fromJson(dynamic json) {
    id = json['id'];
    semester = json['semester'];
    year = json['year'];
    course = json['course'];
    teacher = json['teacher'];
    department = json['department'];
  }
  int? id;
  String? semester;
  int? year;
  int? course;
  int? teacher;
  int? department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['semester'] = semester;
    map['year'] = year;
    map['course'] = course;
    map['teacher'] = teacher;
    map['department'] = department;
    return map;
  }

}

/// id : 2
/// name : "Algorithm"
/// credit_hours : 3
/// Teachering_hours : 3
/// code : "COMP 201"
/// description : "required : COMP212"

class Course {
  Course({
      this.id, 
      this.name, 
      this.creditHours, 
      this.teacheringHours, 
      this.code, 
      this.description,});

  Course.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    creditHours = json['credit_hours'];
    teacheringHours = json['Teachering_hours'];
    code = json['code'];
    description = json['description'];
  }
  int? id;
  String? name;
  int? creditHours;
  int? teacheringHours;
  String? code;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['credit_hours'] = creditHours;
    map['Teachering_hours'] = teacheringHours;
    map['code'] = code;
    map['description'] = description;
    return map;
  }

}