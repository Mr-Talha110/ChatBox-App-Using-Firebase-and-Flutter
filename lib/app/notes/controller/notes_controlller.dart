// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';
import '../../../widgets/update_data.dart';

class NotesController extends GetxController {
  savenotes(dynamic notesController, user) async {
    var notes = notesController.text.trim();
    if (notes != "") {
      try {
        await FirebaseFirestore.instance.collection('notes').doc().set({
          'createdAt': DateTime.now(),
          'note': notes,
          'userId': user!.uid,
        }).then((value) {
          notesController.clear();
          Get.snackbar(
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              snackPosition: SnackPosition.BOTTOM,
              AppStrings.notesSaved,
              '');
        });
      } catch (e) {
        print(e);
      }
    }
  }

  deletenotes(docId) async {
    await FirebaseFirestore.instance.collection('notes').doc(docId).delete();
    Get.snackbar(
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        snackPosition: SnackPosition.BOTTOM,
        AppStrings.notesDel,
        '');
  }

  updatenotes(noteController, docId) async {
    await FirebaseFirestore.instance
        .collection('notes')
        .doc(docId)
        .update({'note': noteController.text.trim()});

    Get.back();
    Get.snackbar(
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        snackPosition: SnackPosition.BOTTOM,
        AppStrings.noteUpdated,
        '');
  }

  updateDialogue(docId, note) {
    Get.dialog(UpdateData(
      docId: docId,
      note: note,
    ));
  }
}
