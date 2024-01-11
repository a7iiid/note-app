import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class ColorSelecte extends StatelessWidget {
  ColorSelecte({super.key});
  Color colornote = ColorApp.ColorNote1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: ColorApp.ColorNote1,
          groupValue: colornote,
          onChanged: (value) {
            colornote = value as Color;
          },
          activeColor: ColorApp.ColorNote1,
          fillColor:
              MaterialStateColor.resolveWith((states) => ColorApp.ColorNote1),
        ),
        Radio(
          value: ColorApp.ColorNote2,
          groupValue: colornote,
          onChanged: (value) {
            colornote = value as Color;
          },
          activeColor: ColorApp.ColorNote1,
          fillColor:
              MaterialStateColor.resolveWith((states) => ColorApp.ColorNote2),
        ),
        Radio(
          value: ColorApp.ColorNote3,
          groupValue: colornote,
          onChanged: (value) {
            colornote = value as Color;
          },
          activeColor: ColorApp.ColorNote1,
          fillColor:
              MaterialStateColor.resolveWith((states) => ColorApp.ColorNote3),
        ),
        Radio(
          value: ColorApp.ColorNote4,
          groupValue: colornote,
          onChanged: (value) {
            colornote = value as Color;
          },
          activeColor: ColorApp.ColorNote1,
          fillColor:
              MaterialStateColor.resolveWith((states) => ColorApp.ColorNote4),
        ),
      ],
    );
  }
}
