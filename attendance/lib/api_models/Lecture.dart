/// count : 1
/// next : null
/// previous : null
/// results : [{"id":1,"date":"2023-05-26","time":"19:25:27","week":1,"picture_1":"http://attendance-proof-production.up.railway.app/images/testing.png","picture_2":null,"picture_3":null,"course_instance":1}]

class Lecture {
  Lecture({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  Lecture.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(LecResults.fromJson(v));
      });
    }
  }
  int? count;
  dynamic next;
  dynamic previous;
  List<LecResults>? results;

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
/// date : "2023-05-26"
/// time : "19:25:27"
/// week : 1
/// picture_1 : "http://attendance-proof-production.up.railway.app/images/testing.png"
/// picture_2 : null
/// picture_3 : null
/// course_instance : 1

class LecResults {
  LecResults({
      this.id, 
      this.date, 
      this.time, 
      this.week, 
      this.picture1, 
      this.picture2, 
      this.picture3, 
      this.courseInstance,});

  LecResults.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    week = json['week'];
    picture1 = json['picture_1'];
    picture2 = json['picture_2'];
    picture3 = json['picture_3'];
    courseInstance = json['course_instance'];
  }
  int? id;
  String? date;
  String? time;
  int? week;
  String? picture1;
  dynamic picture2;
  dynamic picture3;
  int? courseInstance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['time'] = time;
    map['week'] = week;
    map['picture_1'] = picture1;
    map['picture_2'] = picture2;
    map['picture_3'] = picture3;
    map['course_instance'] = courseInstance;
    return map;
  }

}
//hhhhhhhhhhhhh