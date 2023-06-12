import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import '/globals.dart' as globals;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio? dio;
static String? nameStudent;
static List<String>? nameCourse;
static String? email;
static String? department;
static int? level;
static List<String>? description;
static List<Map>? courseList;
  static intit() {

    dio = Dio(BaseOptions(
      baseUrl: "https://attendance-proof-production.up.railway.app/",
      receiveDataWhenStatusError: true,
    ));
  }



  static Future<Response> login(
      {required String email, required String password}) async {

    final request = {"username": email, "password": password};
    Response response = Response(requestOptions: RequestOptions(contentType: "application/json"));
    response= await dio!.post("login/", data: request);

    if (response.statusCode == 200) {

      globals.islogin = true;
      globals.token = response!.data['access'];
      debugPrint(response.data.toString());
        print(globals.token);

      userInformation();
      // getCourses();
      // getDepartment();
      // getLevel();
      return response!;

      print(response);
    }

    return response!;
  }


  static Future<Response?> userInformation() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> Headers = {
     "Content-Type":"application/json",
      "Authorization": "JWT ${globals.token}"
    };

    Response response = await dio!
        .get('auth/users/me/', options: Options(headers: Headers));
     if(response.statusCode == 200){
    await prefs.setString('studentName', response.data['username']);
    await prefs.setInt('userId', response.data['id']);
    await prefs.setInt('courseId', response.data['courseInstance']);

    email= response.data['email'] ;
       nameStudent= response.data['first_name'] +response.data['last_name'] ;

       //return response.data;
     }
     return null;

  }


  static Future<Response<dynamic>> getCourses() async {
    Map<String, dynamic> Headers = {
      "ContentType":"application/json",
      "Authorization": "JWT ${globals.token}"
    };

    Response response = await dio!
        .get('/collage/studentcourses/', options: Options(headers: Headers));
      courseList= response.data['results'];
    print(response.data);
    return response.data;
  }

}
