
import 'package:firstproject/home.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/sign_up.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _passwordTextContoller = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  
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
              child: Column(
                children: <Widget>[
                  logoWidget("lib/assets/images/logo.png"),
                  SizedBox(
                    height: 30,
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
                obscureText: true,
                cursorColor: Colors.white,
                controller: _passwordTextContoller,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.lock_clock_outlined,
                                       color: Colors.white70,
                                    ),
                    labelText: 'password',
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

                  signInSignUpButton(context, true, () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));}),
                  signUpOption()
                ],
              ),
            ),
          )
      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have Account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
              "  Sign Up",
              style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)
          ),
        )
      ],
    );
    

  }


}
