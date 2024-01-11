import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/fetuers/home/presantaion/add_note/add_note_cubit.dart';

import '../../../core/constant/constant.dart';

class ColorSelecte extends StatelessWidget {
  ColorSelecte({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        if (state is SelecteColor) colornote = state.ColorSelected;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: ColorApp.ColorNote1,
              groupValue: colornote,
              onChanged: (value) {
                AddNoteCubit.get(context)
                    .SelectColor(colorselected: value as Color);
              },
              activeColor: ColorApp.ColorNote1,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => ColorApp.ColorNote1),
            ),
            Radio(
              value: ColorApp.ColorNote2,
              groupValue: colornote,
              onChanged: (value) {
                AddNoteCubit.get(context)
                    .SelectColor(colorselected: value as Color);
              },
              activeColor: ColorApp.ColorNote1,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => ColorApp.ColorNote2),
            ),
            Radio(
              value: ColorApp.ColorNote3,
              groupValue: colornote,
              onChanged: (value) {
                AddNoteCubit.get(context)
                    .SelectColor(colorselected: value as Color);
              },
              activeColor: ColorApp.ColorNote1,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => ColorApp.ColorNote3),
            ),
            Radio(
              value: ColorApp.ColorNote4,
              groupValue: colornote,
              onChanged: (value) {
                AddNoteCubit.get(context)
                    .SelectColor(colorselected: value as Color);
              },
              activeColor: ColorApp.ColorNote1,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => ColorApp.ColorNote4),
            ),
          ],
        );
      },
    );
  }
}
