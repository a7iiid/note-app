import 'package:flutter/material.dart';
import 'package:note_app/core/constant/text_style.dart';

class CustomNoteFilure extends StatelessWidget {
  const CustomNoteFilure({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
          child:
              Text('plese try again !', style: style.AppTileStyleSemiBold24)),
    );
  }
}
