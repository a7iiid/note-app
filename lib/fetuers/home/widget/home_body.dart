import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/core/image/assets.dart';
import 'package:note_app/fetuers/splash/view/widget/title_app.dart';

import 'category_selector.dart';
import 'search_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              const TitleApp(),
              const SizedBox(
                height: 18,
              ),
              const SearchField(),
              const SizedBox(
                height: 18,
              ),
              CategorySelector(),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
        NoteList()
      ],
    ));
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.amber),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
