import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

import 'widget/color_selecte.dart';
import 'widget/note_text_filde.dart';
import 'widget/title_text_field.dart';

class AddNoteForm extends StatelessWidget {
  AddNoteForm({
    super.key,
  });

  final _key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TitleTextField(),
              NoteTextFilde(),
              ColorSelecte(),
              ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
