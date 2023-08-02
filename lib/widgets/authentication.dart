// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
    }
  }

  var _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.green[300]!,
                  ),
                ),
                color: Colors.green[900],
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: formKey,
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            cursorColor: Colors.white,
                            autocorrect: false,
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              labelText: 'Email',
                            ),
                            onSaved: (newValue) {
                              _enteredEmail = newValue!;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@') ||
                                  !value.endsWith('.com')) {
                                return 'Please enter a valid email adress';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            cursorColor: Colors.white,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              labelText: 'Password',
                            ),
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[300]),
                            onPressed: () {
                              _submit();
                            },
                            child: Text(
                              _isLogin ? 'Log In' : 'SignUp',
                              style: TextStyle(
                                color: Colors.green[900],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? 'Create an account'
                                  : 'I already have an account',
                              style: TextStyle(
                                color: Colors.green[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
