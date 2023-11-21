// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Dashobard screen/dashboardScreen.dart';
import '../Register screen/signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(children: [
          const SizedBox(height: 140),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(
                color: Color(0xFF565DFA),
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.02,
                letterSpacing: -0.35,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login now to contact with people and track all your expenses & income at a place!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.18,
              ),
            ),
          ),
          const SizedBox(height: 40),
          TextFormField(
            cursorColor: const Color(0xff575DFB),
            controller: loginEmailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff575DFB),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: Color(0xff575DFB), width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: Color(0xff575DFB), width: 1.5)),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Color(0xFFC7C7C7),
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.09,
                letterSpacing: -0.18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: !showPassword,
            cursorColor: const Color(0xff575DFB),
            controller: loginPasswordController,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xff575DFB),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: Color(0xff575DFB), width: 1.5)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: Color(0xff575DFB), width: 1.5)),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color(0xFFC7C7C7),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.18,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? const Icon(
                            Icons.visibility_off,
                            color: Color(0xff575DFB),
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Color(0xff575DFB),
                          ))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Get.to(const ForgetPasswordScreen());
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFF565DFA),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff575DFB),
                    height: 0.17,
                    letterSpacing: -0.13,
                  ),
                )),
          ),
          const SizedBox(height: 28),
          InkWell(
            onTap: () async {
              var loginEmail = loginEmailController.text.trim();
              var loginPassword = loginPasswordController.text.trim();
              try {
                final User? firebaseUser = (await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: loginEmail, password: loginPassword))
                    .user;
                if (firebaseUser != null) {
                  Get.offAll(const DashboardScreen());
                } else {
                  print(
                      'Cannot login at that time. Please check email and password');
                }
              } on FirebaseAuthException catch (e) {
                print('Eror login $e');
              }
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff575DFB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.black, thickness: 1.5),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(16)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/google.png',
                width: 24,
              ),
              const SizedBox(width: 10),
              const Text(
                'Continue with Google',
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: -0.18,
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.to(const SingupScreen());
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFF565DFA),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff575DFB),
                    height: 0,
                    letterSpacing: -0.18,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
        ]),
      ),
    ));
  }
}
