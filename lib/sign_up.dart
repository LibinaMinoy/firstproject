import 'package:firstproject/home.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _CUSATIdTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
      child: Container(
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
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                     Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _userNameTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),
                    SizedBox(
                        height: 20
                    ),
                     Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _emailTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Cusat email',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),
                    SizedBox(
                        height: 20
                    ),
                    Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _CUSATIdTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Cusat ID',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),
               SizedBox(
                        height: 20
                    ),
              Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _phoneTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Phone No',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),
               SizedBox(
                        height: 20
                    ),
              Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _passwordTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),

               SizedBox(
                        height: 20
                    ),
              Container(
             
              
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9)
                ),
                cursorColor: Colors.white,
                controller: _passwordTextController,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                     color: Colors.white.withOpacity(0.9)
                    ),filled: true,
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                   borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
                ),
              ),),


                    SizedBox(
                        height: 20
                    ),
                    signInSignUpButton(context, false, (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    })
                  ],
                ),
              ))),
      ),  );
  }
}
