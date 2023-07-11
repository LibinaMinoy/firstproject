import 'package:firstproject/home_headstaff.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

class LoginPage1 extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the app bar
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 122, 184, 255),
              Color.fromARGB(255, 5, 3, 122),
              Color.fromARGB(255, 1, 15, 69),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 140.0),
                logoWidget("lib/assets/images/logo.png"),
               // SizedBox(height: 20.0),
                Text(
                  '\n\nHEADSTAFF LOGIN',
                  style: TextStyle(
                    fontSize: 32,
                    
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 3, 76),
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    cursorColor: Colors.white,
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white70,
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Color.fromARGB(255, 16, 4, 78).withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.white70,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Color.fromARGB(255, 16, 4, 78).withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 5, 3, 70),
                    ),
                  ),
                  onPressed: () {
                    String username = usernameController.text.trim();
                    String password = passwordController.text.trim();

                    if (username == 'headstaff123' && password == '112233') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HeadHomepage()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Invalid Credentials'),
                            content: Text('Please enter correct username and password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
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
