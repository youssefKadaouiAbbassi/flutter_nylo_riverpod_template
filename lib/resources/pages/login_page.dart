import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/controller.dart';
import '../widgets/forms/login_form_widget.dart';

class LoginPage extends NyStatefulWidget {
  final Function(bool loggedIn)? onLogin;

  LoginPage({this.onLogin});
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {

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
           child: LoginForm(onLogin: widget.onLogin),
         ),
      ),
    );
  }
}
