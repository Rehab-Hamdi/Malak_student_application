import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Notifications.dart';

class Schaduale extends StatefulWidget {
  const Schaduale({Key? key}) : super(key: key);

  @override
  State<Schaduale> createState() => _SchadualeState();
}

class _SchadualeState extends State<Schaduale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,  MaterialPageRoute(builder: (context){
              return  const Notifications();
            }));
          }, icon: const Icon(Icons.notifications))
        ],
        leading: IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon:const Icon(Icons.arrow_back)),
        backgroundColor:const Color(0xff729BD6),
      ),
     body:SfCalendar(
       view: CalendarView.week,
       firstDayOfWeek: 6,
       dataSource: MeetingDataSource(getDataSource()) ,

     ),
    );
  }
}

List<Appointment> getDataSource(){
  
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
          DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 3));


  meetings.add(Appointment(
    startTime: startTime,
    endTime: startTime.add(const Duration(hours: 3)),
    subject: 'Comp 304',
    color: const Color(0xff729BD6),
  ));

  meetings.add(Appointment(
    startTime: DateTime(2023, 5, 18, 14, 0, 0),
    endTime: startTime.add(const Duration(hours: 2)),
    subject: 'Comp 304',
    color: const Color(0xff729BD6),
  ));

  return meetings ;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }

}

