/// count : 3
/// next : null
/// previous : null
/// results : [{"id":1,"student":{"id":1,"user":"Fatima","first_name":"fatima","last_name":"nasser","department":"mathematics"},"lecture":1,"attend":1,"total_attendance":2,"attendance_percentage":100.0,"absent_percentage":0.0},{"id":2,"student":{"id":2,"user":"Ganna","first_name":"Ganna","last_name":"Mahmoud","department":"mathematics"},"lecture":1,"attend":1,"total_attendance":1,"attendance_percentage":50.0,"absent_percentage":0.0},{"id":3,"student":{"id":1,"user":"Fatima","first_name":"fatima","last_name":"nasser","department":"mathematics"},"lecture":2,"attend":1,"total_attendance":2,"attendance_percentage":100.0,"absent_percentage":0.0}]

class Traker {
  Traker({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  Traker.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(AttendanceResults.fromJson(v));
      });
    }
  }
  int? count;
  dynamic next;
  dynamic previous;
  List<AttendanceResults>? results;

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
/// attendance_percentage : 100.0
/// absent_percentage : 0.0

class AttendanceResults {
  AttendanceResults({
      this.id, 
      this.student, 
      this.lecture, 
      this.attend, 
      this.totalAttendance, 
      this.attendancePercentage, 
      this.absentPercentage,});

  AttendanceResults.fromJson(dynamic json) {
    id = json['id'];
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    lecture = json['lecture'];
    attend = json['attend'];
    totalAttendance = json['total_attendance'];
    attendancePercentage = json['attendance_percentage'];
    absentPercentage = json['absent_percentage'];
  }
  int? id;
  Student? student;
  int? lecture;
  int? attend;
  int? totalAttendance;
  double? attendancePercentage;
  double? absentPercentage;

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