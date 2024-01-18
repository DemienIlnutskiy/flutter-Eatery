import 'package:auto_route/auto_route.dart';
import 'package:eatery/features/dishe/view/dishe_screen.dart';
import 'package:eatery/features/eatery_menu/view/eatery_menu_screen.dart';
import 'package:eatery/core/repositories/eatery_menu/models/menu_dishes.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: EateryMenuRoute.page, path: '/'),
        AutoRoute(page: DisheRoute.page),
      ];
}
