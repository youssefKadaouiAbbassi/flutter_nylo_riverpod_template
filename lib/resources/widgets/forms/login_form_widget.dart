import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../routes/router.gr.dart';

class LoginForm extends StatelessWidget {
  final Function(bool)? onLogin;
  LoginForm({Key? key, this.onLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 500,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Stample',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                child: FormBuilder(
              key: _formKey,
              initialValue: {
                'email': '',
                'password': '',
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      onChanged: (val) {
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: FormBuilderTextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                      ]),
                      name: 'password',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () async {
                          bool validation = await _formKey.currentState?.validate() ?? false;
                          if(validation) {
                            print(_formKey.currentState?.fields['email']?.value);
                          }
                        },
                      )),
                ],
              ),
            )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).replace(SignupRoute(onLogin: onLogin));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
