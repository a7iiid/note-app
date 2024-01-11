import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/core/widget/note_Lodaing.dart';
import 'package:note_app/core/widget/note_filure.dart';
import 'package:note_app/fetuers/home/presantaion/cubit/note_cubit.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        //NoteCubit.get(context).getNote();
        if (state is NoteSuccess) {
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: state.note[index].color),
                  child: Column(children: [
                    Text(
                      state.note[index].title,
                      style: style.AppTileStyleSemiBold24,
                    ),
                    Text(
                      state.note[index].note,
                      style: style.NoteNormal12,
                    ),
                  ]),
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
          return SliverToBoxAdapter();
        }
      },
    );
  }
}
