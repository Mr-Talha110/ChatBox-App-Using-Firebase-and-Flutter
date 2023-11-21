import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/Login screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Welcome to',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.26,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'ChatBox',
            style: TextStyle(
              color: Color(0xFF565DFA),
              fontSize: 40,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.44,
            ),
          ),
        ),
        const Text(
          'A place where you can contact with people and keep track of your expenses...',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: -0.18,
          ),
        ),
        const SizedBox(height: 50),
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(16)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Continue with Email',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.09,
                letterSpacing: -0.18,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/at.png',
              width: 24,
            ),
          ]),
        ),
        const SizedBox(height: 25),
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
                Get.offAll(const LoginScreen());
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
    ));
  }
}
