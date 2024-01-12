import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/fetuers/home/widget/color_selecte.dart';
import 'package:note_app/fetuers/home/widget/note_text_filde.dart';
import 'package:note_app/fetuers/home/widget/title_text_field.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';

import '../../core/constant/constant.dart';
import '../models/note_model/note_servise.dart';
import 'presantaion/note/note_cubit.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({
    super.key,
    this.note,
    required this.id,
  });
  NoteModel? note;
  int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              TitleTextField(),
              NoteTextFilde(),
              ColorSelecte(),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: style.TitleNoteBold14,
                ),
                onPressed: () async {
                  note = await NoteModel.fromMap({
                    'category': 'All',
                    'color': colornote.value,
                    'Title': TitleController.text,
                    'note': NoteController.text
                  });
                  NoteServise.get(context).ubdatIsCombleted(id, note);
                  TitleController = TextEditingController();
                  NoteController = TextEditingController();
                  colornote = ColorApp.ColorNote1;
                  NoteCubit.get(context).getNote();

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
