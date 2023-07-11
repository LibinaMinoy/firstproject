import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/area.dart';
import 'package:firstproject/auth_page.dart';
import 'package:firstproject/emailverify.dart';
import 'package:firstproject/home.dart';
import 'package:firstproject/home_staff.dart';
import 'package:firstproject/sign_in.dart';
import 'package:firstproject/splash.dart';
import 'package:firstproject/util.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/colours.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: primary,
      ),
      home:  SplashScreen(),
      
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'),);
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          final email = user.email;

          // Check if the email is for a student or staff
          if (email != null && email.endsWith('@ug.cusat.ac.in')) {
            // User is a student
            return VerifyEmailPage();
          } else if (email != null && email.endsWith('@gmail.com')) {
            // User is staff
            return staffHomePage();
          } else {
            // User email does not match student or staff format
            return Center(child: Text('Invalid user type'),);
          }
        } else {
          return AuthPage();
        }
      },
   ),
  );
}
