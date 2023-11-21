import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.topLeft,
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffe6e6e6))),
          ),
          const SizedBox(height: 50),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Display Name",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff797C7B))),
              SizedBox(height: 5),
              Text("Nazrul Islam",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email Address",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff797C7B))),
              SizedBox(height: 5),
              Text("nazrulIslam20@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Address",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff797C7B))),
              SizedBox(height: 5),
              Text("33 street west subidbazar,sylhet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone  Number",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff797C7B))),
              SizedBox(height: 5),
              Text("(320) 555-0104",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Media Shared",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff797C7B))),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff20A090)),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/recentpic1.png',
                width: 92,
              ),
              Image.asset(
                'assets/images/recentpic2.png',
                width: 92,
              ),
              Image.asset(
                'assets/images/recentpic3.png',
                width: 92,
              ),
            ],
          ),
          const SizedBox(height: 30),
        ]),
      ),
    ));
  }
}
