import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class viewComplaints extends StatefulWidget {
  const viewComplaints({Key? key}) : super(key: key);

  @override
  State<viewComplaints> createState() => _viewComplaintsState();
}

class _viewComplaintsState extends State<viewComplaints> {
  final CollectionReference newComplaint =
      FirebaseFirestore.instance.collection('complaint');

  void deleteRecord(docId) {
    newComplaint.doc(docId).delete();
  }

  Future<void> _showDescriptionDialog(String description) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 300,
          width: 400,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
         child: AppBar(
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0), // Adjust the curve size as desired
              bottomRight: Radius.circular(30.0), // Adjust the curve size as desired
            ),
            child: Container(
              decoration: BoxDecoration(
               color: Color.fromARGB(255, 0, 11, 71)
              ),


              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '\nCOMPLAINT',
                    style: TextStyle(
                      fontSize: 35, // Adjust the size as desired
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
              ),
            ),
          ),
           
        ),
      ),

      body: StreamBuilder(
        stream: newComplaint.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs.reversed.toList();
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot complaintsnap = docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      String description = complaintsnap['discription'];
                      _showDescriptionDialog(description);
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 189, 189, 189),
                            blurRadius: 5,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Text(
                                complaintsnap['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 19, 9, 94),
                                  shadows: [
                                      Shadow(
                                       color: Colors.black.withOpacity(0.4),
                                       blurRadius: 3,
                                       offset: Offset(0, 1),
                                       ),
                                   ],
                                   
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            
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
                                     deleteRecord(complaintsnap.id);
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
