import 'dart:convert';
import 'dart:developer';
import 'package:attendance/api_models/CourseLectures.dart';
import 'package:attendance/api_models/Lecture.dart';
import 'package:attendance/api_models/Traker.dart';
import 'package:http/http.dart' as http;
import '../api_models/StudentCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiManeger {
 static const String baseUrl = "https://attendance-proof-production.up.railway.app/";

 static Future <StudentCourses> GetStudentCourses() async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //courseID
  var userName = prefs.get('studentName');
  log('' , error: userName.toString() );
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/collage/studentcourses/?student__user__username=$userName");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    StudentCourses student = StudentCourses.fromJson(json);
    print(student);
    return student ;
  }

  static Future <CourseLectures> GetLecture(int courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.get('studentId');
    print('api courseId = ${courseId}');
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/tracker/attendances/?attend=&lecture=&student=${id}&lecture__course_instance=${courseId}");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    CourseLectures lec = CourseLectures.fromJson(json);
    print(lec);
    return lec ;

  }

 static Future <Traker> GetAttendance() async {
   Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/tracker/attendances/");
   http.Response response = await http.get(url);
   var json = jsonDecode(response.body);
   Traker Attend = Traker.fromJson(json);
   return Attend ;

 }
}