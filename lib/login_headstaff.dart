import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/home_headstaff.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';

import 'package:firstproject/util.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class invigiLogin extends StatefulWidget {
  const invigiLogin({super.key});

  @override
  State<invigiLogin> createState() => _invigiLoginState();
}

class _invigiLoginState extends State<invigiLogin> {

  final formKey = GlobalKey<FormState>();
  TextEditingController INpasswordTextContoller = TextEditingController();
  TextEditingController INemailTextController = TextEditingController();
  
  @override
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("#CED9D9"),
                hexStringToColor("#2E86C1"),
                hexStringToColor("070A52")
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
                 "HEAD STAFF LOGIN",
                  style: TextStyle(
                  fontSize: 30,
                 fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 62, 112),
                  shadows: [
                  Shadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  ),
                  ],
                  ),
                  ),

                SizedBox(height: 20),

                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    cursorColor: Colors.white,
                    controller: INemailTextController,
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
                    controller: INpasswordTextContoller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.white70,
                      ),
                      labelText: 'password',
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
                Container(
                  width: MediaQuery.of(context).size.width, height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: headstaffsign ,
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

 
  
Future<void> headstaffsign() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator()),
  );

  try {
    if (formKey.currentState!.validate()) {
      final email = INemailTextController.text.trim();
      final password = INpasswordTextContoller.text.trim();

      // Authenticate user using Firebase Authentication
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.email == "headstaff@gmail.com") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HeadHomepage()),
        );
      } else {
        Utils.showSnackBar("Invalid email or password");
      }
    }
  } on FirebaseAuthException catch (e) {
    print(e);
    Utils.showSnackBar(e.message);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}


}
