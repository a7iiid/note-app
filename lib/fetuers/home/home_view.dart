import 'package:flutter/material.dart';
import 'package:note_app/fetuers/home/widget/home_body.dart';

import 'widget/add_note_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
      floatingActionButton: AddNoteButton(),
    );
  }
}
