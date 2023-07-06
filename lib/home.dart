import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/area.dart';
import 'package:firstproject/auth_page.dart';
import 'package:firstproject/forget_password.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/sign_in.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/colours.dart';


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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(320), // Set the preferred height here
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 11, 71),
          elevation: 0,
           flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 90),
            Padding(
             padding: const EdgeInsets.only(bottom: 8.0),
             child: Image.asset(
             'lib/assets/images/logo.png', // Replace with the path to your logo image
              width: 150, // Set your desired width for the logo
              height: 150, // Set your desired height for the logo
                ),
              ),
               SizedBox(height: 30),
                Text(
              'Welcome to Dusty', // Add the "Welcome to Dusty" text here
              style: TextStyle(
               color: Color.fromARGB(255, 255, 255, 255),
               fontSize: 37,
               fontStyle: FontStyle.italic,
               fontWeight: FontWeight.bold,
              ),
            ),
           ],
         ),
         
        ),
      ),
      drawer: Drawer(
  child: ListView(
    children: [
      UserAccountsDrawerHeader(
  accountName: Text(''), // Empty string as the accountName
  accountEmail: Text(
    user.email!,
    style: TextStyle(
      color: Color.fromARGB(255, 0, 11, 71),
      fontSize: 19,
    ),
  ),
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  currentAccountPicture: CircleAvatar(
    child: Icon(
      Icons.person,
      color: Color.fromARGB(255, 255, 255, 255),
      size: 30.0,
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
                  topLeft: Radius.circular(50),
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
            color: Color.fromARGB(255, 255, 255, 255)
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
               
                SizedBox(height: 80),
                ElevatedButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectArea()));
                
                  },
                
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(7),
                    fixedSize: Size(300, 100),
                    textStyle: TextStyle(
            
                      fontWeight: FontWeight.bold,
                    ),
                    primary: Color.fromARGB(255, 8, 18, 71),
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    elevation: 15,
                    shadowColor: Color.fromARGB(255, 0, 0, 0),
                    side: BorderSide(color: Color.fromARGB(255, 19, 11, 103), width: 2),
                          
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Flexible(
                      child: Text(
                        'Request for Cleaning',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                       ), ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                       child: Text(
                        'You can tell me where to be Cleaned',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15
                          ),
                      ),),
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
                    primary: Color.fromARGB(255,8, 18, 71),
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 0, 0, 0),
                    side: BorderSide(color: Color.fromARGB(255,8, 18, 71), width: 2),
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
