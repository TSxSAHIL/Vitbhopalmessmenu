import 'package:flutter/material.dart';

class BoysMenuScreen extends StatelessWidget {
  const BoysMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final Map<String, Map<String, List<String>>> menu = {
      '2022-05-08': {
        'Breakfast': ['Poha', 'Paratha', 'Dahi'],
        'Lunch': [
          'Rajma',
          'Jeera Rice',
          'Mix Veg',
          'Chapati',
          'Salad',
          'Papad'
        ],
        'Snacks': ['Samosa', 'Tea'],
        'Dinner': ['Aloo Gobi', 'Rice', 'Chapati', 'Salad', 'Raita'],
      },
      '2022-05-11': {
        'Breakfast': ['Bread Butter', 'Idli Sambhar', 'Tea'],
        'Lunch': [
          'Chole Masala',
          'Rice',
          'Tawa Roti',
          'Raita',
          'Salad',
          'Papad'
        ],
        'Snacks': ['Poha', 'Tea'],
        'Dinner': ['Malai Kofta', 'Jeera Rice', 'Chapati', 'Salad', 'Raita'],
      },
    };

    final todaysMenu = menu[today.toString()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boys Menu'),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Menu - ${today.toString()}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildMenuList('Breakfast', todaysMenu?['Breakfast'] ?? []),
            const SizedBox(height: 20),
            _buildMenuList('Lunch', todaysMenu?['Lunch'] ?? []),
            const SizedBox(height: 20),
            _buildMenuList('Snacks', todaysMenu?['Snacks'] ?? []),
            const SizedBox(height: 20),
            _buildMenuList('Dinner', todaysMenu?['Dinner'] ?? []),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (items.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(item),
                  ),
                )
                .toList(),
          )
        else
          const Text('No items found.'),
      ],
    );
  }
}
