import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepPurple, 
        child: Center(
          child: Text(
            "Hello Flutter, " + sayHello(),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 36.0),
          ),
        ),
      );
  }
String sayHello() {
  String hello;
  DateTime now = new DateTime.now();
  int hour = now.hour;
  int minute = now.minute;
  if(hour < 12)
    hello = "Good Morning";
  else if(hour < 18)
    hello = "Good Afternoon";
  else
    hello = "Good Evening";

  String minutes = (minute < 10) ? "0" + minute.toString() : minute.toString();

  return "${hello.toString()} !\nIt's now ${hour.toString()}:${minutes.toString()}";
}
}