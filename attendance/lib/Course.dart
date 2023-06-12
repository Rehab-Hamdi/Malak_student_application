import 'package:attendance/api/api_maneger.dart';
import 'package:attendance/api_models/CourseLectures.dart';
import 'package:attendance/api_models/Lecture.dart';
import 'package:attendance/api_models/Traker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Notifications.dart';

class CourseAttendance extends StatelessWidget {
  CourseAttendance({required this.courseCode, required this.courseId});
  static const String routename = 'Course';
  String? courseCode;
  int? courseId;
  var totalAbsent;
  var totalAttand;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // change the color here
          ),
          title: Text(
            courseCode ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Notifications();
                  }));
                },
                icon: Icon(Icons.notifications))
          ],
          // leading: IconButton(
          //     onPressed: () => Navigator.pop(context, false),
          //     icon: const Icon(Icons.arrow_back)),
          backgroundColor: Color(0xff729BD6),
        ),
        body: Column(
          children: [
            // ListTile(
            //   title: Text(
            //     'Doctor : Wael Zkaria',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   subtitle: Row(
            //     children: [
            //       SizedBox(
            //         width: 52,
            //       ),
            //       Text('Attend : 40%'),
            //       SizedBox(
            //         width: 62,
            //       ),
            //       Text('Absent : 0%'),
            //     ],
            //   ),
            // ),
            FutureBuilder(
              future: ApiManeger.GetLecture(courseId!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  CourseLectures? lecture = snapshot.data as CourseLectures?;
                  if (lecture?.results?.isEmpty ?? true) {
                    return const Padding(
                      padding: EdgeInsets.only(top:150.0),
                      child: Center(child: Text('No lectures exist', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: lecture?.results?.map((result) {
                            int? lecNum = result.lecture;
                            totalAbsent = result.absentPercentage;
                            totalAttand = result.attendancePercentage;
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                color: result.attend == 0
                                    ? Colors.red.withOpacity(0.2)
                                    : Colors.green.withOpacity(0.2),
                                child: ListTile(
                                  subtitle: Text(
                                      result.attend == 0 ? 'Absent' : 'Attend'),
                                  title: Text(
                                    'Lecture ${lecNum}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  leading: Icon(
                                    Icons.import_contacts_outlined,
                                  ),
                                ),
                              ),
                            );
                            //   FutureBuilder(
                            //   future: ApiManeger.GetAttendance(),
                            //   builder: (BuildContext context, AsyncSnapshot snap) {
                            //     if (snap.hasData) {
                            //       return ListView(
                            //         children: trak?.results?.map((res) {
                            //           return Padding(
                            //             padding: const EdgeInsets.only(top: 10, bottom: 10),
                            //             child: Container(
                            //               color: Colors.black26,
                            //               child: ListTile(
                            //                 title: Text(
                            //                   'Lecture ${lecNum ?? 0}',
                            //                   style: TextStyle(fontWeight: FontWeight.w800),
                            //                 ),
                            //                 trailing:
                            //                 res.attend == 0 ? Icon(
                            //                   Icons.close,
                            //                   color: Colors.redAccent,
                            //                 ) : Icon(
                            //                   Icons.check,
                            //                   color: Colors.green,
                            //                 )
                            //               ),
                            //             ),
                            //           );
                            //         }).toList() ?? [],
                            //       );
                            //     } else {
                            //       return Center(child:Text(snap.error.toString()));
                            //     }
                            //   },
                            // );
                          }).toList() ??
                          [],
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
