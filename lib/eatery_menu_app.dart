import 'package:eatery/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

import 'core/config/router/router.dart';

//Основний клас в якому здійснюються переходи і підключення компонентів
class EateryMenuApp extends StatefulWidget {
  const EateryMenuApp({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<EateryMenuApp> createState() => _EateryMenuAppState();
}

class _EateryMenuAppState extends State<EateryMenuApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Внесення назви програми
      title: widget.title,
      //Підключення світлої теми
      theme: lightTheme,
      //Підключення компонента для переходу між екранами
      routerConfig: _router.config(),
    );
  }
}
