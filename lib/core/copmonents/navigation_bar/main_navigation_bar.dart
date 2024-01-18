import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Їдальня'),
        BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Розклад'),
        BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Бейджик'),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}
