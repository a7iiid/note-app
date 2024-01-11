import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 1; // Choose an integer not used by other TypeAdapters

  @override
  Color read(BinaryReader reader) {
    // Read the color value as int and return it as a Color
    return Color(reader.readInt());
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    // Write the color value as int
    writer.writeInt(obj.value);
  }
}
