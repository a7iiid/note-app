import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                fit: BoxFit.fitHeight,
                child: GestureDetector(
                  onLongPress: () {
                    NoteServise.get(context).deleteNote(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: state.note[index].color),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 18),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                state.note[index].title,
                                style: style.AppTileStyleSemiBold24,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .33,
                                child: Text(
                                  state.note[index].note,
                                  style: style.NoteNormal12,
                                  maxLines: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
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
}
