import 'package:attendance/Courses.dart';
import 'package:attendance/LoginScreen.dart';
import 'package:attendance/Notifications.dart';
import 'package:attendance/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Course.dart';
import 'Home.dart';
import 'LayOut.dart';
import 'Schaduale.dart';
import 'dio_helper.dart';
import '/globals.dart' as globals;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  globals.token ;
  DioHelper.intit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        'LayOut': (context) => LayOut(),
        'Home': (context) => Home(),
        'Courses': (context) => Courses(),
        'Profile': (context) => Profile(),
        'Schaduale': (context) => Schaduale(),
        'Notifications': (context) => Notifications(),
      },
    );
  }
}

