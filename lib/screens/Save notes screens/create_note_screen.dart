// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Widgets/update_data.dart';
import 'package:note_app/utils/strings.dart';

import '../../utils/constants.dart';

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
        iconTheme: const IconThemeData(color: AppColors.backgroundColor),
        title: const Text(
          AppStrings.saveNotes,
          style: TextStyle(color: AppColors.backgroundColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppColors.greenColor,
              controller: notesController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.note_alt_sharp,
                  color: AppColors.greenColor,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: AppColors.greenColor, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide:
                        BorderSide(color: AppColors.greenColor, width: 1.5)),
                hintText: AppStrings.notes,
                hintStyle: TextStyle(
                  color: AppColors.lightGrey,
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
                          AppStrings.notesSaved,
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
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  AppStrings.save,
                  style: TextStyle(
                    color: AppColors.white,
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
                  return const Text(AppStrings.errorOccured);
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.greenColor,
                  ));
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text(
                    AppStrings.dataNotAvailable,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: AppColors.backgroundColor,
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
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note,
                                style: const TextStyle(color: AppColors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: AppColors.white,
                                    onTap: () {
                                      Get.dialog(UpdateData(
                                        docId: docId,
                                        note: note,
                                      ));
                                      print(docId);
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: AppColors.white,
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
                                          AppStrings.notesDel,
                                          '');
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: AppColors.white,
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
