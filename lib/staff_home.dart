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
        preferredSize: Size.fromHeight(150), // Adjust the height as desired
        child: AppBar(
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
                    Color(0xFF00145D),
                    Color(0xFF001B83),
                  ],
                ),
              ),


              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'CLEAN REQUESTS',
                    style: TextStyle(
                      fontSize: 30, // Adjust the size as desired
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
              ),
            ),
          ),
           actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
             child: GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => viewComplaints()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/images/complaint.png",
                      width: 21.0,
                      height: 21.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Complaints",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, 
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
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
                       FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => MainPage()),
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
                    SizedBox(height: 600),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
      body: StreamBuilder(
        stream: users.snapshots() ,
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount:  snapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot usersnap = snapshot.data.docs[index];
                bool isChecked = usersnap['done'] ?? false; // Retrieve the checkbox state from the database
                

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 153, 169, 183),
                          blurRadius: 10,
                          spreadRadius: 15,
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        child: CircleAvatar(backgroundColor: Color.fromARGB(255, 20, 10, 67),
                        radius: 30,
                        child: Text(usersnap['department'],
                        style: TextStyle(fontSize: 25),
                        ),),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      
                          Text(usersnap['specifiedarea'],
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          
                          Text('(${usersnap['area']}),',style: TextStyle(fontWeight: FontWeight.bold),),  // Add a comma after "area"
                              Text('${usersnap['floor']}floor',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                           Text('Reason: ${usersnap['reason']}',
                           style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      
                          Text(usersnap['date'],
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          
                        ],
                
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                  value: isChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isChecked = newValue ?? false;
                                      users.doc(usersnap.id).update({'done': isChecked}); // Update the checkbox state in the database
                                    });
                                  },
                                  checkColor: Colors.white, // Set the color of the check icon
                                   activeColor: Color.fromARGB(255, 8, 51, 83), // Set the color of the checkbox when checked
                                ),
                          ],
                        ),
                
                    ]
                    
                    ),
                  ),
                );

              },
            );
          }
          return Container();
        },
      )
    );
  }
}
