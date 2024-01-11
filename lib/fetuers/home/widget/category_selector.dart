import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/fetuers/home/presantaion/cubit/note_cubit.dart';

class CategorySelector extends StatelessWidget {
  int selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Important',
    'Lecture notes',
    'To-do lists',
    'Shopping'
  ];

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
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    print(selectedIndex);
                    NoteCubit.get(context).changeSelectedCategory();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.black
                            : ColorApp.ColorContenerList,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(categories[index],
                          style: selectedIndex == index
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
