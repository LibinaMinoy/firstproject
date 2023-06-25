import 'package:firstproject/home.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _CUSATIdTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmpasswordTextController = TextEditingController();
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
            child:Form(
              key: formKey,
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
                validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^[a-zA-Z]+$').hasMatch(value!)){
                    return "Enter valid name";
                  }else{
                    return null;
                  }
                },
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
                validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^[a-zA-Z0-9_.+-]+@ug\.cusat\.ac\.in$').hasMatch(value!)){
                    return "Enter cusat email";
                  }else{
                    return null;
                  }
                },
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
                validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^.{4,8}$').hasMatch(value!)){
                    return "Enter password";
                  }else{
                    return null;
                  }
                },
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
                controller: _confirmpasswordTextController,
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
                validator: (value){
                 if (value!.isEmpty ||
                              value != _passwordTextController.text) {
                            return "Passwords do not match";
                          } else {
                            return null;
                          }
                },
              ),),


                    SizedBox(
                        height: 20
                    ),
                    signInSignUpButton(context, false, (){
                      if(formKey.currentState!.validate()){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                       password: _passwordTextController.text).then((value) => (){
                        print("created an account");    
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                       }
                       ).catchError((error){
                        print("error creating an account: $error");
                       }
                        
                       );   
                     
                      }
                      
                    },)
                  ],
                ),
              ))),
      ), ) );
  }
}
