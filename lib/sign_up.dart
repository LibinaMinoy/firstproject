import 'package:firstproject/home.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/util.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';
class SignUp extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUp({Key? key, required this.onClickedSignIn})
   : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmpasswordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(170),
         child: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 35,color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      ),
      body: SingleChildScrollView(
      child: Container(
        
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
            child:Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                     SizedBox(height: 60,),
                     
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
                 obscureText: true,
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
                  if(value!.isEmpty ||!RegExp(r'^.{6,10}$').hasMatch(value!)){
                    return "Enter password with more that 6 characters";
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
                 obscureText: true,
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
                    Container(
                  width: MediaQuery.of(context).size.width, height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: signup,
                    child: Text(
                     'SUBMIT',
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
                     SizedBox(
                        height: 20
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        text: 'Already have an account? ',
                        children:[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                            text: ' Log In',
                            style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.lightBlue,
                          fontStyle: FontStyle.italic
                        )
                          ),
                        ]
                        ))
                  ],
                ),
              ))),
      ), ) );
  }
  Future signup() async{

    showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context) => Center(child: CircularProgressIndicator(),)
     );
    try {
      if(formKey.currentState!.validate()){
        
  await FirebaseAuth.instance.createUserWithEmailAndPassword
  (
    email: _emailTextController.text.trim(),
   password: _passwordTextController.text.trim(),
   );

   // data store connection is given here.
      }
} on FirebaseAuthException catch (e) {
  print(e);

  Utils.showSnackBar(e.message);
}
 navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
