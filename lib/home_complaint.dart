import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/req_confirm.dart';
import 'package:flutter/material.dart';

class NewComplaint extends StatefulWidget {
  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
 final _formKey = GlobalKey<FormState>();
 String _title = '';
 String _description = '';
 final CollectionReference newComplaint =
      FirebaseFirestore.instance.collection('complaint');

 void addComplaint(){
  try {
   final data = {
    'title': _title,
    'discription': _description,
   };
   newComplaint.add(data);
  } 
  catch (e) 
  {
   print('Error adding user: $e');
  }
 }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Complaint'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\nComplaint',
                    style: TextStyle(
                      fontSize: 37, // Adjust the size as desired
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 19, 65),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 17, 5, 84),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 139, 168, 193),
                         blurRadius: 8,
                          spreadRadius: 7,
                        ),
                    ],
                  ),
                         child: TextFormField(
                          style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                         validator: (value) {
                         if (value == null || value.isEmpty) {
                              return 'Please enter a title.';
                               }
                             return null;
                          },
                          
                        decoration: InputDecoration(
                         labelText: 'Title',
                         labelStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white
                           ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        ),
    
                      onSaved: (value) => _title = value!,
                       ),
                     ),

                SizedBox(height: 15),
                Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 139, 168, 193),
                         blurRadius: 8,
                          spreadRadius: 7,
                        ),
                    ],
                  ),
                  
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Description',
                    labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                      ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),),
                     maxLines: 5,
                    onSaved: (value) => _description = value!,
                  ),
                ),
                SizedBox(height: 16),
               Container(
                 
                  margin: const EdgeInsets.fromLTRB(100, 250, 100, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                 child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Handle complaint registration and submission.
                        // For this example, let's simulate a delay of 2 seconds to mimic the registration process.
                        Future.delayed(Duration(seconds: 2), () {
                         // All fields are valid, add the user
                        addComplaint();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestConfirmPage(),
                          ),
                          );
                        });
                      }
                    },
                    child: Center(
                      child: 
                      Text('Register',
                      style: const TextStyle(
                       color: Color.fromARGB(255, 242, 242, 242), 
                       fontWeight: FontWeight.bold, 
                       fontSize: 16),
      ),
      
                    ),
                  ),
               ),
              ],
            ),
          ),
           ),
    ),
   );
  }
}
