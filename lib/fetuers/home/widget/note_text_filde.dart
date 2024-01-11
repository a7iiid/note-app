import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class NoteTextFilde extends StatelessWidget {
  NoteTextFilde({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: TextFormField(
          maxLines: 20,
          autocorrect: true,
          controller: NoteController,
          decoration: InputDecoration(
            labelText: ' Note',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                style: BorderStyle.none,
              ),
            ),

            fillColor: const Color(0xffECECEC),

            // Here you can add the prefixIcon if you want to show an icon inside the TextField
            prefixIcon: const Icon(Icons.notes_sharp),
          ),
        ));
  }
}
