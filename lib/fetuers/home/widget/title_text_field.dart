import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class TitleTextField extends StatelessWidget {
  TitleTextField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          height: 70,
          child: TextFormField(
            controller: TitleController,
            decoration: InputDecoration(
              labelText: 'Title Note',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  style: BorderStyle.none,
                ),
              ),
              fillColor: const Color(0xffECECEC),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              // Here you can add the prefixIcon if you want to show an icon inside the TextField
              prefixIcon: const Icon(Icons.title),
            ),
          ),
        ));
  }
}
