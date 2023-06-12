import 'package:attendance/api/api_maneger.dart';
import 'package:attendance/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Course.dart';
import 'Notifications.dart';
import 'api_models/StudentCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Courses extends StatefulWidget {
  Courses({Key? key}) : super(key: key);
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
   int selectedLectureID=1;

  // void _retrieveSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('courseId', selectedLectureID);
  //   // print("courseID =${selectedLectureID}");
  // }

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
              builder: (BuildContext, snapshot) {
                if (snapshot.hasData) {
                  StudentCourses? studentCourses =
                      snapshot.data as StudentCourses?;

                  return Column(
                    children: studentCourses?.results?.map((result) {
                          String courseCode = result.course?.code ?? '';
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedLectureID = result.course?.id??1;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseAttendance(
                                            courseCode: courseCode,
                                          courseId: selectedLectureID,
                                        )),
                                  );
                                },
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
                        }).toList() ??
                        [],
                  );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              })),
    );
  }
}
