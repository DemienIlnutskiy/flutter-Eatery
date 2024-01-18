import 'package:eatery/core/constants/app_strings.dart';
import 'package:eatery/eatery_menu_app.dart';
import 'package:eatery/core/config/firebase/firebase_options.dart';
import 'package:eatery/core/repositories/eatery_menu/eatery_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//Початковий клас, який викликається при включенні додатку
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ініціалізація бази даних Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Підключечення компоненту GetIT до додатку
  GetIt.I.registerLazySingleton<MenuRepository>(() => MenuRepository());
  //виклик класу EateryMenuApp
  runApp(const EateryMenuApp(
    title: AppStrings.appTitle,
  ));
}
