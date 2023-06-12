/// count : 2
/// next : null
/// previous : null
/// results : [{"id":1,"student":{"id":1,"user":"Fatima","first_name":"fatima","last_name":"nasser","department":"mathematics"},"lecture":1,"attend":1,"total_attendance":2,"attendance_percentage":40.0,"absent_percentage":0.0,"lecture_week":1},{"id":3,"student":{"id":1,"user":"Fatima","first_name":"fatima","last_name":"nasser","department":"mathematics"},"lecture":2,"attend":1,"total_attendance":2,"attendance_percentage":40.0,"absent_percentage":0.0,"lecture_week":2}]

class CourseLectures {
  CourseLectures({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  CourseLectures.fromJson(dynamic json) {
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

/// id : 1
/// student : {"id":1,"user":"Fatima","first_name":"fatima","last_name":"nasser","department":"mathematics"}
/// lecture : 1
/// attend : 1
/// total_attendance : 2
/// attendance_percentage : 40.0
/// absent_percentage : 0.0
/// lecture_week : 1

class Results {
  Results({
      this.id, 
      this.student, 
      this.lecture, 
      this.attend, 
      this.totalAttendance, 
      this.attendancePercentage, 
      this.absentPercentage, 
      this.lectureWeek,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    lecture = json['lecture'];
    attend = json['attend'];
    totalAttendance = json['total_attendance'];
    attendancePercentage = json['attendance_percentage'];
    absentPercentage = json['absent_percentage'];
    lectureWeek = json['lecture_week'];
  }
  int? id;
  Student? student;
  int? lecture;
  int? attend;
  int? totalAttendance;
  double? attendancePercentage;
  double? absentPercentage;
  int? lectureWeek;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (student != null) {
      map['student'] = student?.toJson();
    }
    map['lecture'] = lecture;
    map['attend'] = attend;
    map['total_attendance'] = totalAttendance;
    map['attendance_percentage'] = attendancePercentage;
    map['absent_percentage'] = absentPercentage;
    map['lecture_week'] = lectureWeek;
    return map;
  }

}

/// id : 1
/// user : "Fatima"
/// first_name : "fatima"
/// last_name : "nasser"
/// department : "mathematics"

class Student {
  Student({
      this.id, 
      this.user, 
      this.firstName, 
      this.lastName, 
      this.department,});

  Student.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    department = json['department'];
  }
  int? id;
  String? user;
  String? firstName;
  String? lastName;
  String? department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user'] = user;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['department'] = department;
    return map;
  }

}