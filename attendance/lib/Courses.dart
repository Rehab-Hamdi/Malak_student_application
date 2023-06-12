
import 'package:attendance/api/api_maneger.dart';
import 'package:attendance/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Course.dart';
import 'Notifications.dart';
import 'api_models/StudentCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Courses extends StatelessWidget {
   Courses({Key? key}) : super(key: key);

   void _retrieveSharedPreferences(courseID) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setInt('CourseId', courseID!);
     print("courseID =${courseID}");
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Courses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Navigator.pop(context, false),
                icon: const Icon(Icons.arrow_back)),
            backgroundColor: const Color(0xff729BD6),
          ),
          body: FutureBuilder(
              future: ApiManeger.GetStudentCourses(),
              builder: (BuildContext, snapshot)  {
                if (snapshot.hasData) {
                  StudentCourses? studentCourses =
                      snapshot.data as StudentCourses?;

                  return Column(
                    children: studentCourses?.results?.map((result) {
                      int? courseID= result.course?.id;
                      _retrieveSharedPreferences(courseID);
                          String courseCode = result.course?.code ?? '';
                          return Column(
                            children: [
                              InkWell(onTap: () {  Navigator.push(
                                context,    MaterialPageRoute(builder: (context) => CourseAttendance(courseCode:courseCode)),
                              );},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        courseCode,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        }).toList() ?? [],
                  );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              })),
    );
  }
}
