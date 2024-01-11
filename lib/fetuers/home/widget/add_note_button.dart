import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/routes.dart';

import '../add_note_form.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(kaddnoteview);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff1F2937),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
    );
  }
}
