import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/main.dart';
import 'package:firstproject/view_complaints.dart';
import 'package:flutter/material.dart';

class staffHomePage extends StatefulWidget {
  const staffHomePage({Key? key});

  @override
  State<staffHomePage> createState() => _staffHomePageState();
}

class _staffHomePageState extends State<staffHomePage> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170), // Adjust the height as desired
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0), // Adjust the curve size as desired
              bottomRight: Radius.circular(30.0), // Adjust the curve size as desired
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 3, 0, 161),
                    Color.fromARGB(255, 8, 18, 58),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'CLEAN REQUESTS',
                    style: TextStyle(
                      fontSize: 37, // Adjust the size as desired
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Text(
            "Sign Out",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            });
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ],
  
        ),
      ),
    
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs.reversed.toList(); // Reverse the order of the docs list

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot usersnap = docs[index];
                bool isChecked = usersnap['done'] ?? false;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 153, 169, 183),
                            blurRadius: 10,
                            spreadRadius: 15,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 20, 10, 67),
                            radius: 30,
                            child: Text(
                              usersnap['department'],
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                usersnap['specifiedarea'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(${usersnap['area']}),', style: TextStyle(fontWeight: FontWeight.bold), // Add a comma after "area"
                              ),
                              Text(
                                '${usersnap['floor']} floor',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Reason: ${usersnap['reason']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                usersnap['date'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Checkbox(
                                value: isChecked,
                                onChanged: (newValue) {
                                  setState(() {
                                    isChecked = newValue ?? false;
                                    users.doc(usersnap.id).update(
                                        {'done': isChecked}); // Update the checkbox state in the database
                                  });
                                },
                                checkColor: Colors.white, // Set the color of the check icon
                                activeColor:
                                    Color.fromARGB(255, 8, 51, 83), // Set the color of the checkbox when checked
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
     ),
    );
  }
}
