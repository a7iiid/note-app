import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/fetuers/home/presantaion/note/note_cubit.dart';

class CategorySelector extends StatelessWidget {
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
                    NoteCubit.get(context).getNote(index);
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
