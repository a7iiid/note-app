import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';
import 'package:note_app/fetuers/models/note_model/note_servise.dart';

import '../../core/constant/constant.dart';
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
      child: Scaffold(
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TitleTextField(),
                NoteTextFilde(),
                ColorSelecte(),
                ElevatedButton(
                  child: Text(
                    'Add note',
                    style: style.TitleNoteBold14,
                  ),
                  onPressed: () async {
                    NoteModel note = NoteModel(
                        category: 'All',
                        color: colornote,
                        title: TitleController.text,
                        note: NoteController.text);
                    NoteServise.get(context).addItem(note);
                    TitleController = TextEditingController();
                    NoteController = TextEditingController();
                    colornote = ColorApp.ColorNote1;

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
