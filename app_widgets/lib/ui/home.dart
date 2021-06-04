import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      color: Colors.deepOrangeAccent,
      //width: 192,
      //height: 96,
      //margin: EdgeInsets.all(50),
      child: Text(
        "Pizza",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
      ),
    ));
  }
}
