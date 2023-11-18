// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/components/update_data.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController notesController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Save Your Notes here',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              cursorColor: const Color(0xff575DFB),
              controller: notesController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.note_alt_sharp,
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
                hintText: 'Notes',
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
            const SizedBox(height: 50),
            InkWell(
              onTap: () async {
                var notes = notesController.text.trim();
                if (notes != "") {
                  try {
                    await FirebaseFirestore.instance
                        .collection('notes')
                        .doc()
                        .set({
                      'createdAt': DateTime.now(),
                      'note': notes,
                      'userId': user!.uid,
                    }).then((value) {
                      notesController.clear();
                      Get.snackbar(
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 50),
                          snackPosition: SnackPosition.BOTTOM,
                          'Note Saved',
                          '');
                    });
                  } catch (e) {
                    print(e);
                  }
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
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('notes')
                  .where('userId', isEqualTo: user!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Erorr Occurred');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xff575DFB),
                  ));
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text(
                    'No Data Available',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ));
                }
                if (snapshot != null && snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var note = snapshot.data!.docs[index]['note'];
                        var docId = snapshot.data!.docs[index].id;
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                              color: const Color(0xff575DFB),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      Get.dialog(UpdateData(
                                        docId: docId,
                                        note: note,
                                      ));
                                      print(docId);
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('notes')
                                          .doc(docId)
                                          .delete();
                                      Get.snackbar(
                                          duration: const Duration(seconds: 1),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 50),
                                          snackPosition: SnackPosition.BOTTOM,
                                          'Note Deleted',
                                          '');
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }
                return Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
