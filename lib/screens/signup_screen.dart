import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          title: const Text(
            'Firebase App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(children: [
            const SizedBox(height: 50),
            const Text(
              'Signup Page',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: userPhoneController,
                decoration: const InputDecoration(hintText: 'Phone'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: userEmailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: userPasswordController,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    )),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  var userName = userNameController.text.trim();
                  var userPhone = userPhoneController.text.trim();
                  var userEmail = userEmailController.text.trim();
                  var userPassword = userPasswordController.text.trim();

                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmail, password: userPassword)
                      .then((value) => {
                            print('User created'),
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc()
                                .set({
                              'username': userName,
                              'userPhone': userPhone,
                              'userEmail': userEmail,
                            }).catchError((error) {
                              print('error occured during data storing $error');
                            }),
                          })
                      .catchError((error) {
                    print(' error occured $error');
                  });
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ));
  }
}
