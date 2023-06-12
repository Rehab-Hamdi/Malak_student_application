import 'package:attendance/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child:ListView(
              children: [
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff729BD6),
                    borderRadius: BorderRadius.circular(15),),
                  child: ListTile(
                    title: Text('${DioHelper.nameStudent}',
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),),
                    trailing: Icon(Icons.person,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff729BD6),
                    borderRadius: BorderRadius.circular(15),),
                  child: ListTile(
                    title: Text('Computer Science & Math',
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),),
                    trailing: Icon(Icons.app_registration,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff729BD6),
                    borderRadius: BorderRadius.circular(15),),
                  child: ListTile(
                    title: Text('Level',
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),),
                    trailing: Icon(Icons.leaderboard,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color:Color(0xff729BD6),
                    borderRadius: BorderRadius.circular(15),),
                  child: ListTile(
                    title: Text('Phone Number',
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),),
                    trailing: Icon(Icons.phone,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color:Color(0xff729BD6),
                    borderRadius: BorderRadius.circular(15),),
                  child: ListTile(
                    title: Text('${DioHelper.email}',
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),),
                    trailing: Icon(Icons.email,color: Colors.white),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
