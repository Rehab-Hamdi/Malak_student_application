import 'package:attendance/Courses.dart';
import 'package:attendance/Schaduale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dio_helper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var r = DioHelper.userInformation();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Courses();
              }));},
              child: Container(
                child:
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Attendance by \n     Courses',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,bottom: 10,top: 15),
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/graduation.png',fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                width:400,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff729BD6),
                  borderRadius: BorderRadius.circular(15),

                ),),
            ),
            SizedBox(height: 20,),
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Schaduale();
              }));},
              child:
              Container(
                child:
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('     Schedule',style:
                        TextStyle(fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 65,bottom: 10,top: 10),
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Image.asset('assets/calendar-date.png',fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width:400,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff729BD6),
                  borderRadius: BorderRadius.circular(15),

                ),),
            ),


          ],
        ),
      ),
    );
  }
}
