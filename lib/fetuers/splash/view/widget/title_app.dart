import 'package:flutter/material.dart';
import 'package:note_app/core/constant/text_style.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'THI',
            style: style.AppTileStyleSemiBold24,
          ),
          Text(
            'N',
            style: style.AppTileStyleSemiBold24.copyWith(
                color: const Color(0xffB0E9CA)),
          ),
          Text(
            'K.',
            style: style.AppTileStyleSemiBold24,
          )
        ]);
  }
}
