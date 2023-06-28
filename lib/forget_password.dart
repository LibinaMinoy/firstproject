import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/util.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final formkey =GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  @override

  void dispose(){
     _emailTextController.dispose();

     super.dispose();
  }
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 156, 192),
        
        title: Text('Reset Password'),
      ),
      body: Container(
        
         width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("#CED9D9"),
                hexStringToColor("#2E86C1"),
                hexStringToColor("070A52"),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          

        child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Receive an email to\nreset your password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailTextController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^[a-zA-Z0-9_.+-]+@ug\.cusat\.ac\.in$').hasMatch(value!)){
                    return "Enter cusat email";
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.email_outlined),
                label: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: verifyEmail,
              
              )
            ],
          ),
        )),
 
      ),
      
             
    );
    return scaffold;
  }
    Future verifyEmail() async{
      showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context) => Center(child: CircularProgressIndicator(),)
     );
      try {
      await FirebaseAuth.instance.
       sendPasswordResetEmail(email: _emailTextController.text.trim());

       Utils.showSnackBar('Password Reset Email Sent');
       Navigator.of(context).popUntil((route) => route.isFirst);
      } on FirebaseAuthException catch (e) {
         print(e);

         Utils.showSnackBar(e.message);
         Navigator.of(context).pop();
         }

    }
  
}
