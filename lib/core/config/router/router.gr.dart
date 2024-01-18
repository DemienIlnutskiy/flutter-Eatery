// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DisheRoute.name: (routeData) {
      final args = routeData.argsAs<DisheRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DisheScreen(
          key: args.key,
          dishe: args.dishe,
        ),
      );
    },
    EateryMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EateryMenuScreen(),
      );
    },
  };
}

/// generated route for
/// [DisheScreen]
class DisheRoute extends PageRouteInfo<DisheRouteArgs> {
  DisheRoute({
    Key? key,
    required MenuDishe dishe,
    List<PageRouteInfo>? children,
  }) : super(
          DisheRoute.name,
          args: DisheRouteArgs(
            key: key,
            dishe: dishe,
          ),
          initialChildren: children,
        );

  static const String name = 'DisheRoute';

  static const PageInfo<DisheRouteArgs> page = PageInfo<DisheRouteArgs>(name);
}

class DisheRouteArgs {
  const DisheRouteArgs({
    this.key,
    required this.dishe,
  });

  final Key? key;

  final MenuDishe dishe;

  @override
  String toString() {
    return 'DisheRouteArgs{key: $key, dishe: $dishe}';
  }
}

/// generated route for
/// [EateryMenuScreen]
class EateryMenuRoute extends PageRouteInfo<void> {
  const EateryMenuRoute({List<PageRouteInfo>? children})
      : super(
          EateryMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'EateryMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
