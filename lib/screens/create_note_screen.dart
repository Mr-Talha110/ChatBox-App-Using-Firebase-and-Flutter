// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                      });
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
