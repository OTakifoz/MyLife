// ignore_for_file: unused_field, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_life/models/pallette.dart';
import 'package:my_life/models/user.dart';
import 'package:my_life/providers/authentication_provider.dart';
import 'package:my_life/widgets/authentication_screen/forgot_password_dialog.dart';

final firebase = FirebaseAuth.instance;

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  void showResetPasswordDialog() {
    showDialog(
        context: context, builder: (context) => const ForgotPasswordDialog());
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  // ignore: prefer_final_fields

  bool isChecked = false;
  var _isLogin = true;
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authenticationProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber, Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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
                              controller: emailController,
                              style: whiteFontedStyle(16),
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
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: whiteFontedStyle(16)),
                              onSaved: (newValue) {
                                emailController.text = newValue!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@') ||
                                    !value.trimRight().endsWith('.com')) {
                                  return 'Please enter a valid email adress';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (!_isLogin)
                              Column(
                                children: [
                                  TextFormField(
                                    controller: usernameController,
                                    style: whiteFontedStyle(16),
                                    cursorColor: Colors.white,
                                    autocorrect: false,
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.abc,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Username',
                                        labelStyle: whiteFontedStyle(16)),
                                    onSaved: (newValue) {
                                      usernameController.text = newValue!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value.trim().length < 4) {
                                        return 'Please enter at least 4 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            TextFormField(
                              style: whiteFontedStyle(16),
                              controller: passwordController,
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
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.white)),
                                  labelText: 'Password',
                                  labelStyle: whiteFontedStyle(16)),
                              onSaved: (newValue) {
                                passwordController.text = newValue!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                              obscureText: !isChecked,
                            ),
                            if (!_isLogin)
                              const SizedBox(
                                height: 12,
                              ),
                            !_isLogin
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        style: whiteFontedStyle(16),
                                        cursorColor: Colors.white,
                                        autofocus: true,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.password,
                                              color: Colors.white,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: Colors.white)),
                                            labelText: 'Confirm Password',
                                            labelStyle: whiteFontedStyle(16)),
                                        validator: (value) {
                                          if (passwordController.text !=
                                              value) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                        obscureText: !isChecked,
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        fillColor: MaterialStateProperty.all(
                                            Colors.white),
                                        checkColor: Colors.green[900],
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = !isChecked;
                                          });
                                        }),
                                    Text(
                                      'Show Password',
                                      style: whiteFontedStyle(12),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                if (_isLogin)
                                  GestureDetector(
                                    onTap: () {
                                      showResetPasswordDialog();
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: whiteFontedStyle(12),
                                    ),
                                  )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        fixedSize: const Size.fromHeight(55),
                                        backgroundColor: Colors.green[300]),
                                    onPressed: () {
                                      authProvider.submitUserData(
                                          emailController.text,
                                          usernameController.text,
                                          _isLogin
                                              ? AuthMode.login
                                              : AuthMode.signup,
                                          passwordController.text);
                                      authProvider.signWithEmailAndPassword();
                                    },
                                    child: Text(_isLogin ? 'Log In' : 'Sign Up',
                                        style: whiteFontedStyle(16)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text('Or', style: whiteFontedStyle(16)),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      authProvider.signInWithGoogle();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[300],
                                      fixedSize: const Size.fromHeight(55),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.5),
                                            child: Image.asset(
                                                'assets/icons/google-icon.png'),
                                          ),
                                        ),
                                        Text(
                                          'Sign With Google',
                                          style: whiteFontedStyle(16),
                                        ),
                                        const SizedBox(
                                          width: 48,
                                          height: 48,
                                          child: Padding(
                                            padding: EdgeInsets.all(7.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                  _isLogin
                                      ? "Don't have an account? Create one"
                                      : 'Already have an account? Login',
                                  style: whiteFontedStyle(16)),
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
      ),
    );
  }
}
