import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/constant/constant.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/core/routes.dart';
import 'package:note_app/core/widget/note_Lodaing.dart';
import 'package:note_app/core/widget/note_filure.dart';
import 'package:note_app/fetuers/home/presantaion/note/note_cubit.dart';
import 'package:note_app/fetuers/models/note_model/note_servise.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteSuccess) {
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8, // Added spacing between cards
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: 500),
                child: GestureDetector(
                  onTap: () {
                    colornote = state.note[index].color;
                    TitleController.text = state.note[index].title;
                    NoteController.text = state.note[index].note;
                    GoRouter.of(context).push(keditnote, extra: index);
                  },
                  onLongPress: () async {
                    await awesomedilog(context, index).show();
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: state.note[index].color,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                state.note[index].title,
                                style: style.AppTileStyleSemiBold24,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.note[index].note,
                                style: style.NoteNormal12,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: state.note.length,
          );
        }
        if (state is NoteNull) {
          return state.notenull;
        }
        if (state is NoteFailure) {
          return const CustomNoteFilure();
        }
        if (state is NoteLoading) {
          return const CustomNoteLoading();
        } else {
          return const SliverToBoxAdapter();
        }
      },
    );
  }

  AwesomeDialog awesomedilog(BuildContext context, int index) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      title: 'Delete',
      dialogType: DialogType.warning,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await NoteCubit.get(context).deletenote();
        await NoteServise.get(context).deleteNote(index);
      },
    );
  }
}
