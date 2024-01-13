import 'package:flutter/material.dart';

import 'package:note_app/fetuers/splash/view/widget/title_app.dart';

import 'category_selector.dart';
import 'note_list.dart';
import '../../search/search_field.dart';

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
              SearchField(),
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
