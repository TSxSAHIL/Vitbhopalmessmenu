import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  final List<Menu> menus = [
    Menu(date: DateTime(2023, 5, 8), items: ['Item 1', 'Item 2', 'Item 3']),
    Menu(date: DateTime(2023, 5, 9), items: ['Item 4', 'Item 5', 'Item 6']),
    Menu(date: DateTime(2023, 5, 10), items: ['Item 7', 'Item 8', 'Item 9']),
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final menu = menus.firstWhere((menu) =>
        menu.date.year == today.year &&
        menu.date.month == today.month &&
        menu.date.day == today.day,
        orElse: () => Menu(date: today, items: []));

    return MaterialApp(
      title: 'Menu App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("VIT BHOPAL MESS MENU"),
          backgroundColor: const Color(0xff1D267D),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Today\'s menu:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              ...menu.items.map((item) => Text(item)),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu {
  final DateTime date;
  final List<String> items;

  const Menu({
    required this.date,
    required this.items,
  });
}
