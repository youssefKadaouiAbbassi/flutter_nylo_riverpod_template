import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../routes/router.gr.dart';
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
    print('LoginPage init ${widget.onLogin}');
    if (widget.onLogin == null){
      AutoRouter.of(context).push(MyHomeRoute());
    }
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
           child: LoginForm(onLogin: widget.onLogin ),
         ),
      ),
    );
  }
}
