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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: const Text(
          'Save Your Notes here',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              controller: notesController,
              cursorColor: Colors.red,
              maxLines: null,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: 'Add Notes',
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
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
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                )),
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
                    color: Colors.red,
                  ));
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text(
                    'No Data Available',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
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
                              color: Colors.red,
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
