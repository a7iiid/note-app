import 'package:flutter/material.dart';
import 'package:note_app/core/routes.dart';
import 'package:note_app/core/them.dart';

void main() {
  runApp(const Think());
}

class Think extends StatelessWidget {
  const Think({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeApp.themeapp,
      routerConfig: routes,
    );
  }
}
