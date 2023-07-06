
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/forget_password.dart';
import 'package:firstproject/main.dart';
import 'package:firstproject/reusable_widgets/reusable_widget.dart';
import 'package:firstproject/login_selection.dart';

import 'package:firstproject/util.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';



class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignIn({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final formKey = GlobalKey<FormState>();
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
                  
              child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                logoWidget("lib/assets/images/logo.png"),
                SizedBox(height: 30),
                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    cursorColor: Colors.white,
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white70,
                      ),
                      labelText: 'Cusat email',
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
                  if(value!.isEmpty ||!RegExp(r'^[a-zA-Z0-9_.+-]+@ug\.cusat\.ac\.in$').hasMatch(value!)){
                    return "Enter cusat email";
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
                    controller: _passwordTextContoller,
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
                    onPressed: sign,
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
                GestureDetector(
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(203, 215, 237, 1),
                      fontSize: 16,
                    )
                  ),
                  onTap: () =>Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Forget(),)),
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white,fontSize: 16),
                    text: 'No account?  ',
                    children: [
                      TextSpan(
                         recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up' ,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      )
                    ]
                  )),
                  SizedBox(height: 10),

                  Container(
               // height: 1.0,
               // width: 450.0,
               // color: Color.fromARGB(179, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => selectStaff()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/images/sweep.png",
                      width: 21.0,
                      height: 21.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Cleaning Staff?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, 
                        fontSize: 17,
                      ),
                    ),
                  ],
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

 
  
Future sign() async{
  showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context) => Center(child: CircularProgressIndicator(),)
     );
   try {
  if(formKey.currentState!.validate()){
   await FirebaseAuth.instance.signInWithEmailAndPassword(
     email: _emailTextController.text.trim(),
      password: _passwordTextContoller.text.trim(),
      );
  }
} on FirebaseAuthException catch (e) {
  print(e);
  
Utils.showSnackBar(e.message);
}
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

}


