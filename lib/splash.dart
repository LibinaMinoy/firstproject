import 'package:firstproject/main.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay the navigation to the main screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF00145D),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250.0,
            ),
            logoWidget("lib/assets/images/logo.png"),
            SizedBox(
              height: 200.0,
            ),
            SpinKitThreeBounce(
              color: Colors.indigo,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
