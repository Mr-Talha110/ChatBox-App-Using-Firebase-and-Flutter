import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/notes/controller/notes_controlller.dart';
import 'package:note_app/utils/strings.dart';

import '../utils/constants.dart';

class UpdateData extends StatefulWidget {
  final dynamic note;
  final dynamic docId;
  const UpdateData({super.key, required this.note, required this.docId});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController noteController = TextEditingController();
  final controller = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  AppStrings.editNote,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  style: const TextStyle(color: AppColors.white),
                  controller: noteController..text = '${widget.note}',
                  cursorColor: AppColors.white,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.white))),
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
                                MaterialStatePropertyAll(AppColors.white)),
                        onPressed: () {
                          controller.updatenotes(noteController, widget.docId);
                        },
                        child: const Text(
                          AppStrings.update,
                          style: TextStyle(color: AppColors.backgroundColor),
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
                          AppStrings.cancel,
                          style: TextStyle(color: AppColors.backgroundColor),
                        )),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
