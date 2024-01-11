import 'package:flutter/material.dart';

class CustomNoteLoading extends StatelessWidget {
  const CustomNoteLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()));
  }
}
