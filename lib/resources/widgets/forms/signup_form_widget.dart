import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/models/auth/signup_form.dart';
import '../../../app/stores/auth_store.dart';
import '../../../routes/router.gr.dart';

class SignupForm extends HookConsumerWidget {
  final Function(bool loggedIn)? onLogin;

  SignupForm({Key? key, this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                child: FormBuilder(
              key: _formKey,
              initialValue: {
                'firstName': '',
                'lastName': '',
                'email': '',
                'password': '',
                'confirmPassword': '',
              },
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: FormBuilderTextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First name',
                                ),
                                name: 'firstName',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(3),
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              child: FormBuilderTextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last name',
                                ),
                                name: 'lastName',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(3),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      )),
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
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: FormBuilderTextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm password',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                        (value) {
                          var password = _formKey
                                  .currentState?.fields['password']?.value ??
                              '';
                          if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ]),
                      name: 'confirmPassword',
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
                        child: const Text('sign up'),
                        onPressed: () async {
                          bool validation =
                              await _formKey.currentState?.validate() ?? false;
                          if (validation) {
                            signup(
                                ref,
                                SignupFormModel(
                                    firstName: _formKey
                                            .currentState?.fields['firstName']?.value ??
                                        '',
                                    lastName: _formKey
                                            .currentState?.fields['lastName']?.value ??
                                        '',
                                    email:
                                        _formKey.currentState?.fields['email']?.value ??
                                            '',
                                    password: _formKey
                                            .currentState?.fields['password']?.value ??
                                        ''), onLogin: onLogin);
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
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    AutoRouter.of(context)
                        .replace(LoginRoute(onLogin: onLogin));
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
