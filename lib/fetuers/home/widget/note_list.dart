import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/constant/text_style.dart';
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
        NoteCubit.get(context).getNote();
        if (state is NoteSuccess) {
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8, // Added spacing between cards
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              // print(state.note[2].note);
              return GestureDetector(
                onLongPress: () async {
                  await awesomedilog(context, index).show();
                },
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.note[index].title,
                            style: style.AppTileStyleSemiBold24,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              state.note[index].note,
                              style: style.NoteNormal12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
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
      btnOkOnPress: () {
        NoteServise.get(context).deleteNote(index);
      },
    );
  }
}
