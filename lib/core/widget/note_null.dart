import 'package:flutter/material.dart';
import 'package:note_app/core/constant/text_style.dart';

class CustomNoteNull extends StatelessWidget {
  const CustomNoteNull({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
          child: Text(
        'you dont have any note !',
        style: style.AppTileStyleSemiBold24,
      )),
    );
  }
}
