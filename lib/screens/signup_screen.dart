// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/signUpServices.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool showPassword = false;

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          forceMaterialTransparency: true,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
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
                  'Create an account to access all the features!',
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
              const SizedBox(height: 50),
              TextFormField(
                cursorColor: const Color(0xff575DFB),
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xff575DFB),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  hintText: 'Ex: Talha',
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: const Color(0xff575DFB),
                controller: userNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.house_rounded,
                    color: Color(0xff575DFB),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  hintText: 'Ex: example123',
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: const Color(0xff575DFB),
                controller: userPhoneController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xff575DFB),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  hintText: 'Ex: 000-0000-0000',
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
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: const Color(0xff575DFB),
                controller: userEmailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff575DFB),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xff575DFB), width: 1.5)),
                  hintText: 'Ex: abc@example.com',
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
              const SizedBox(height: 10),
              TextFormField(
                obscureText: !showPassword,
                cursorColor: const Color(0xff575DFB),
                controller: userPasswordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff575DFB),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
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
                          showPassword = !showPassword;
                          setState(() {});
                        },
                        icon: showPassword
                            ? const Icon(Icons.visibility_off,
                                color: Color(0xff575DFB))
                            : const Icon(Icons.visibility,
                                color: Color(0xff575DFB)))),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  var userName = userNameController.text.trim();
                  var userPhone = userPhoneController.text.trim();
                  var userEmail = userEmailController.text.trim();
                  var userPassword = userPasswordController.text.trim();
                  var name = nameController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmail, password: userPassword)
                      .then((value) => {
                            print('User created'),
                            signUpUser(userName, userPhone, userEmail,
                                userPassword, name),
                          })
                      .catchError((error) {
                    print('Error occurred during user creation $error');
                  });
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
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF565DFA),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF565DFA),
                        height: 0,
                        letterSpacing: -0.18,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
