import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/req_confirm.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class SelectArea extends StatefulWidget {
  const SelectArea({Key? key});

  @override
  State<SelectArea> createState() => _SelectAreaState();
}

class _SelectAreaState extends State<SelectArea> {
  final departments = ['IT', 'CS', 'SF', 'EC', 'CIVIL', 'EEE', 'MECH'];
  String? selectedDepartment;

  final area = [
    'CLASSROOM',
    'LAB',
    'BATHROOM-GIRLS',
    'BATHROOM-BOYS',
    'OTHERS'
  ];
  String? selectedArea;

  final floor = ['GROUND', '1', '2', '3'];
  String? selectedFloor;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  
  TextEditingController _specifyAreaController = TextEditingController();
  TextEditingController _issueController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();

  DateTime? _selectedDate;

  bool _isDateValid(String date) {
    final datePattern = r'^\d{2}/\d{2}/\d{2}$';
    final regex = RegExp(datePattern);
    return regex.hasMatch(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateTextController.text = DateFormat('dd/MM/yy').format(picked);
      });
    }
  }

  void addUser() {
    try {
      final data = {
        'date': _dateTextController.text,
        'department': selectedDepartment,
        'area': selectedArea,
        'specifiedarea': _specifyAreaController.text,
        'floor': selectedFloor,
        'reason': _issueController.text,
        'done': false,
      };
      users.add(data);
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'SELECT THE AREA',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        color: Color.fromARGB(255, 8, 18, 71).withOpacity(.9),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 8, 18, 71).withOpacity(0.9)),
                    cursorColor: const Color.fromARGB(255, 8, 18, 71),
                    controller: _dateTextController,
                    onTap: () {
                      _selectDate(context);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: const Color.fromARGB(179, 14, 13, 13),
                      ),
                      labelText: 'Date',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text("Select Department"),
                    
                  ),
                  items: departments
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedDepartment = val as String?;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text("Select Area"),
                  ),
                  items: area
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedArea = val as String?;
                    });
                  },
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 16, 16).withOpacity(0.9)),
                    cursorColor: const Color.fromARGB(255, 9, 8, 8),
                    controller: _specifyAreaController,
                    decoration: InputDecoration(
                      labelText: 'SPECIFY THE AREA(classroom no/lab name)',
                      
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text("Select Floor"),
                    
                  ),
                  items: floor
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedFloor = val as String?;
                    });
                  },
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 16, 16).withOpacity(0.9)),
                    cursorColor: const Color.fromARGB(255, 9, 8, 8),
                    controller: _issueController,
                    decoration: InputDecoration(
                      labelText: 'what is the issue?(spills,dust)',
                    
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedDepartment == null ||
                      selectedArea == null ||
                      selectedFloor == null ||
                      _dateTextController.text.isEmpty ||
                      _specifyAreaController.text.isEmpty ||
                      _issueController.text.isEmpty) {
                    // Fields are not selected or empty, show an error message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please fill in all the fields.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (!_isDateValid(_dateTextController.text)) {
                    // Date is not in the correct format, show an error message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter a valid date (dd/mm/yy).'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // All fields are valid, add the user
                    addUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestConfirmPage(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 5, 10, 67).withOpacity(0.9),
                  // Set background color to white
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      'CONFIRM',
                      style: TextStyle(
                        color: Colors.white, // Set text color to blue
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
    ),
  );
  }
}