import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/home.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/sign_up.dart';
import 'package:firstproject/home_staff.dart';
import 'package:firstproject/util.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'main.dart';


class staffLogin extends StatefulWidget {
  const staffLogin({super.key});

  @override
  State<staffLogin> createState() => _staffLoginState();
}

class _staffLoginState extends State<staffLogin> {
 final formKey = GlobalKey<FormState>();
  TextEditingController passwordTextContoller = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("#CED9D9"),
                //hexStringToColor("#2E86C1"),
                hexStringToColor("#1147ab"),
                hexStringToColor("#081247")
              ],begin: Alignment.topCenter, end: Alignment.bottomCenter )),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height*0.2, 20, 0),
                  
              child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                logoWidget("lib/assets/images/logo.png"),
                SizedBox(height: 20),
                Text(
                 "STAFF LOGIN",
                  style: TextStyle(
                  fontSize: 32,
                 fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 178, 178, 178),
                  shadows: [
                  Shadow(
                  color: Color.fromARGB(255, 1, 0, 0).withOpacity(0.4),
                  blurRadius: 200,
                  offset: Offset(0, 2),
                  ),
                  ],
                  ),
                  ),

                SizedBox(height: 50),

                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    cursorColor: Colors.white,
                    controller: emailTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white70,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^[A-Za-z0-9._%+-]+@gmail\.com$').hasMatch(value!)){
                    return "Enter valid Email";
                  }else{
                    return null;
                  }
                },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    obscureText: true,
                    cursorColor: Colors.white,
                    controller: passwordTextContoller,
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
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                     validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^.{6,10}$').hasMatch(value!)){
                    return "Enter password with more that 6 characters";
                  }else{
                    return null;
                  }
                  
                },
                
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: MediaQuery.of(context).size.width, height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: staffsign ,
                    child: Text(
                     'LOG IN',
                     style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black87;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),
                  ),
                ),
                
              SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

 
  
Future<bool> staffsign() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator()),
  );
  try {
    if (formKey.currentState!.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextContoller.text.trim(),
      ).then((value) {
        Navigator.of(context).pop(); // Close the loading dialog
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => staffHomePage()),
        );
      });
      return true; // Sign-in successful
    }
  } on FirebaseAuthException catch (e) {
    print(e);
    Utils.showSnackBar(e.message);
  }
  Navigator.of(context).pop(); // Close the loading dialog
  return false; // Sign-in failed
}

// ...



}
