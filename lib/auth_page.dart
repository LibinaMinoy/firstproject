import 'package:firstproject/sign_in.dart';
import 'package:firstproject/sign_up.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
  ? SignIn( onClickedSignUp: toggle) 
  : SignUp( onClickedSignIn: toggle);

  void toggle() => setState(() {
    isLogin = !isLogin;
  });
}