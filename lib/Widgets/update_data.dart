import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateData extends StatefulWidget {
  final dynamic note;
  final dynamic docId;
  const UpdateData({super.key, required this.note, required this.docId});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Edit Note',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: noteController..text = '${widget.note}',
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('notes')
                              .doc(widget.docId)
                              .update({'note': noteController.text.trim()});

                          Get.back();
                          Get.snackbar(
                              duration: const Duration(seconds: 1),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 50),
                              snackPosition: SnackPosition.BOTTOM,
                              'Note Updated',
                              '');
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.red),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10)),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
