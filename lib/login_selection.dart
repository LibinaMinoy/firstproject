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
                hexStringToColor("#0f2652"),
                hexStringToColor("#CED9D9"),
                hexStringToColor("#0f2652"),
                //hexStringToColor("#CED9D9"),

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
                  MaterialPageRoute(builder: (context) => LoginPage1()),
                  );// Navigate to invigilator page
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 2, 29, 84),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Text(
                  "HEAD STAFF",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 205, 205, 205),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
             Container(
               // height: 1.0,
               // width: 450.0,
               // color: Color.fromARGB(179, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.0,
                        color: Color.fromARGB(255, 8, 18, 71),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 8, 18, 71),
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2.0,
                        color: Color.fromARGB(255, 8, 18, 71),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => staffLogin()),
                  ); // Navigate to cleaning staff page
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 2, 29, 84),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Align(
                  alignment: Alignment.center, 
                  child: Text(
                    "CLEANING \n    STAFF",
                    style: TextStyle(
                      fontSize: 25,
                      
                      fontWeight: FontWeight.bold,
                      
                      color: Color.fromARGB(255, 205, 205, 205),
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
