import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../widgets/forms/signup_form_widget.dart';

class SignupPage extends NyStatefulWidget {
  final Function(bool loggedIn)? onLogin;

  SignupPage({this.onLogin});
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<SignupPage> {

  @override
  init() async {
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
         child: Container(
           child: SignupForm(onLogin: widget.onLogin),
         ),
      ),
    );
  }
}
