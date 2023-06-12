import 'package:attendance/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendance/Notifications.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:badges/badges.dart';

import 'dio_helper.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  State<LayOut> createState() => _LayOutState();
}
class _LayOutState extends State<LayOut> {
 int currentIndex = 0 ;
 int voicemails = 10 ;
 List<Widget> screens =
 [
   Home(),
   Profile(),
   Notifications(),
 ];
 List<String> titles =
     [
       'Home',
       'Profile',
       'Settings',
     ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex],
        style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
        )
          ,),
        centerTitle: true,
        actions: [

        ],
        leading:IconButton(
            onPressed: () => Navigator.pop(context,false),

            icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff729BD6),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff729BD6),
        currentIndex: currentIndex ,
        onTap: (index)
        {
          setState(() {
            currentIndex = index ;
          });;
        },
        fixedColor: Colors.white,
        items: const [
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
          )*/
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.home),
          ),label:'Home',),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.person),
          ),label:'Profile'),
          // BottomNavigationBarItem(icon: IconButton(onPressed: (){
          //   Navigator.push(context,  MaterialPageRoute(builder: (context){
          //     return Notifications();
          //   }));
          // }, icon: Badge(
          //   child: Icon(Icons.notifications),
          //   badgeContent: Text('$voicemails',style: TextStyle(fontSize: 8,color: Colors.white),),
          //   badgeColor: Colors.redAccent,
          //   showBadge: voicemails > 0 ? true : false ,
          // )
          // ),label:'Notification')
        ],
      ),
    );
  }
}
