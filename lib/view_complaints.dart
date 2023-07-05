import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

class viewComplaints extends StatefulWidget {
  const viewComplaints({Key? key}) : super(key: key);

  @override
  State<viewComplaints> createState() => _viewComplaintsState();
}

class _viewComplaintsState extends State<viewComplaints> {
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
                // Navigate to invigilator page
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
                // Navigate to cleaning staff page
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
