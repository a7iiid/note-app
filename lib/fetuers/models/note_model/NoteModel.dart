// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String note;

  @HiveField(2)
  Color color;

  @HiveField(3)
  String category;
  NoteModel(
      {required this.title,
      required this.note,
      required this.color,
      required this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Title': title,
      'note': note,
      'color': color.value,
      'category': category
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        title: map['Title'] as String,
        note: map['note'] as String,
        color: Color(map['color'] as int),
        category: map['category'] as String);
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
