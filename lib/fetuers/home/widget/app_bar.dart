import 'package:flutter/material.dart';
import 'package:note_app/core/constant/text_style.dart';
import 'package:note_app/core/presentaition/them_mode/cubit/theem_mode_cubit.dart';

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
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .42,
          ),
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
          ),
          const Spacer(),
          IconButton(
              onPressed: () => TheemModeCubit.get(context).changemode(),
              icon: Icon(Icons.brightness_6_outlined))
        ]);
  }
}
