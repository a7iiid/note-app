import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/fetuers/home/data/repo/home_repo_implemant.dart';
import 'package:note_app/fetuers/models/note_model/NoteModel.dart';

final homerepo = HomeRepoImplemant();
Color colornote = ColorApp.ColorNote1;
TextEditingController NoteController = TextEditingController();
TextEditingController TitleController = TextEditingController();
List<NoteModel> searchfilterd = [];
List<NoteModel>? allnote;
