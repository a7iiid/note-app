// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class style {
  static TextStyle AppTileStyleSemiBold24 = const TextStyle(
    fontFamily: "Inter",
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 29 / 24,
  );
  static TextStyle TitleNoteBold14 = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff131313),
    height: 16 / 14,
  );
  static TextStyle NoteNormal12 = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff131313),
  );
  static TextStyle NoteListSubject = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff7c7c7c),
    height: 14 / 12,
  );
  static TextStyle NoteCatogNotSelect = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff7c7c7c),
    height: 14 / 12,
  );
  static TextStyle NoteCatogSelect = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 249, 249, 249),
    height: 14 / 12,
  );
}
