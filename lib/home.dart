import 'package:firstproject/area.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Aavani P K",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "aavanipk2002@gmail.com",
                style: TextStyle(fontSize: 17),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 25, 127),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "A",
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 25, 127),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.white,
                radius: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 120, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Semester: IV",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Department: Information Technology",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Gender: Female",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Phone no: 9496035500",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        fixedSize: Size(300, 60),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.indigo[900],
                        elevation: 10,
                        side: BorderSide(color: Colors.blue, width: 2),
                      ),
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_sharp),
              ),
              title: Text("Edit Profile"),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.password_outlined),
              ),
              title: Text("Reset Password"),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout),
              ),
              title: Text("Sign Out"),
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    'Welcome to Dusty',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 37,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                logoWidget("lib/assets/images/logo.png"),
                SizedBox(height: 20),
                ElevatedButton(
                  
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
                       ), ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                       child: Text(
                        'You can tell me where to be Cleaned',
                        style: TextStyle(fontSize: 14),
                      ),),
                    ],
                  ),
                  onPressed: () {
                      Navigator.pushNamed(context, '/selectarea');
                  },
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

