import 'package:auto_route/auto_route.dart';
import 'package:eatery/core/config/router/router.dart';
import 'package:flutter/material.dart';

class SubNavigationBar extends StatelessWidget {
  const SubNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text('User'), accountEmail: Text('UserEmail')),
          ListTile(
            title: const Text('Меню'),
            onTap: () => AutoRouter.of(context).push(const EateryMenuRoute()),
          )
        ],
      ),
    );
  }
}
