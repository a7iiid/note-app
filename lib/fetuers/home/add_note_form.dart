// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'presantaion/note/note_cubit.dart';
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
                const SizedBox(
                  height: 16,
                ),
                TitleTextField(),
                NoteTextFilde(),
                ColorSelecte(),
                category(),
                ElevatedButton(
                  child: Text(
                    'Add note',
                    style: style.TitleNoteBold14,
                  ),
                  onPressed: () async {
                    await NoteCubit.get(context).addnote(context);

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

class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: NoteCubit.get(context).categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    NoteCubit.get(context).category(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: NoteCubit.get(context).categoryselect == index
                            ? Colors.black
                            : ColorApp.ColorContenerList,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(NoteCubit.get(context).categories[index],
                          style: NoteCubit.get(context).categoryselect == index
                              ? style.NoteCatogSelect
                              : style.NoteCatogNotSelect),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
