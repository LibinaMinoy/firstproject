import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/area.dart';
import 'package:firstproject/auth_page.dart';
import 'package:firstproject/forget_password.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/sign_in.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              
              accountName: Text(
                "Gayathri",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 11, 71),
                  fontSize: 20, 
                  fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                user.email!,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 11, 71),
                  fontSize: 19),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "G",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 0, 11, 71),
                radius: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 11, 71),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    ListTile(
                     leading: IconButton(
                      onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Forget()),
                       );
                      },
                     icon: Container(
                      child: Icon(
                       Icons.password_outlined,
                      ),
                      color: Colors.white, // Set color to white
                     ),
                    ),
                    title: Text(
                     "Reset Password",
                     style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                     ),
                    ),
                   ),
                    ListTile(
                     leading: IconButton(
                      onPressed: () {
                       FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => AuthPage()),
                        );
                       });
                      },
                      icon: Container(
                       child: Icon(
                        Icons.logout,
                       ),
                       color: Colors.white, // Set color to white
                       ),
                      ),
                      title: Text(
                       "Sign Out",
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                       ),
                      ),
                    ),
                    SizedBox(height: 450),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("#CED9D9"),
                hexStringToColor("#2E86C1"),
                hexStringToColor("070A52"),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Welcome to Dusty',
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 13, 66),
                      fontSize: 37,
                    //  fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                logoWidget("lib/assets/images/logo.png"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectArea()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(300, 120),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.indigo[900],
                    elevation: 15,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: Text(
                          'Request for Cleaning',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          'You can tell me where to be Cleaned',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectArea()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(300, 100),
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.indigo[900],
                    elevation: 15,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: Text('Any Complaint?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
