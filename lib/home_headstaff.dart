import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/view_complaints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';


class HeadHomepage extends StatefulWidget {
  const HeadHomepage({super.key});

  @override
  State<HeadHomepage> createState() => _HeadHomepageState();
}

class _HeadHomepageState extends State<HeadHomepage> {

    final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

      void deleteRecord(docId){
       users.doc(docId).delete();
      }

  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Close the app
        return false; // Return false to prevent going back
      },

       child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200), // Adjust the height as desired
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: ClipRRect(           
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
                      'RECORDS',
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
             GestureDetector (
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => viewComplaints()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "lib/assets/images/complaint.png",
                          width: 21.0,
                          height: 21.0,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          "Complaint",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: users.snapshots() ,
          builder: (context,AsyncSnapshot snapshot){
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
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                         [
                       
                            Container(
                              
                              child: CircleAvatar(backgroundColor: Color.fromARGB(255, 20, 10, 67),
                              radius: 30,
                              child: Text(usersnap['department'],
                              style: TextStyle(fontSize: 25),
                              ),),
     
                            ),
                            
                          
                        
                         Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          
                              Text(usersnap['specifiedarea'],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                              
                              Text('(${usersnap['area']}),',style: TextStyle(fontWeight: FontWeight.bold),),  // Add a comma after "area"
                                  Text('${usersnap['floor']} floor',
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                               Text('Reason: ${usersnap['reason']}',
                               style: TextStyle(fontWeight: FontWeight.bold),),
                              
                            ],
                                        
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 7),
                            Text(usersnap['date'],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
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
     
                                  IconButton(
                                     onPressed: () {
                                    showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                     return AlertDialog(
                                     title: Text("Confirmation",
                                     style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Color(0xB5000000),
                                     fontSize: 21,
                                    ),
                                    ),
                                     content: Text("This record will be deleted permanently.",
                                     style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                     fontSize: 18,
                                    ),),
                                    actions: [
                                   TextButton(
                                    child: Text("Cancel",
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 51, 130),
                                     fontSize: 20,
                                    ),
                                    ),
                                      onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                       },
                                     ),
                                     TextButton(
                                      child: Text("OK",
                                       style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 51, 130),
                                    fontSize: 20,
                                    ),
                                      ),
                                      onPressed: () {
                                       Navigator.of(context).pop(); // Close the dialog
                                       deleteRecord(usersnap.id);
                                        },
                                    ),
                                    ],
                                    );
                                   },
                                );
                             },
                                   icon: Icon(Icons.delete),
                                    color: Color.fromARGB(255, 8, 44, 105),
                                ),
     
                                
                              ],
                  
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
       ),
     );
}
}
