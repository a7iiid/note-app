import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/fetuers/home/presantaion/note/note_cubit.dart';
import 'package:note_app/fetuers/search/presantation/search_note/search_note_cubit.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNoteCubit(),
      child: BlocBuilder<SearchNoteCubit, SearchNoteState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Container(
                height: 70,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for notes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: const Color(0xffECECEC),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    SearchNoteCubit.get(context).search(searchController.text);
                    NoteCubit.get(context).getNote();
                  },
                ),
              ));
        },
      ),
    );
  }
}
