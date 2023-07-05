

import 'package:firstproject/login_headstaff.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'login_staff.dart';

class selectStaff extends StatefulWidget {
  const selectStaff({super.key});

  @override
  State<selectStaff> createState() => _selectStaffState();
}

class _selectStaffState extends State<selectStaff> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("#CED9D9"),
              hexStringToColor("#2E86C1"),
              hexStringToColor("#070A52"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => invigiLogin()),
                  );// Navigate to invigilator page
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                child: Text(
                  "HEAD STAFF",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => staffLogin()),
                  ); // Navigate to cleaning staff page
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                child: Center(
                  child: Text(
                    "CLEANING STAFF",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
