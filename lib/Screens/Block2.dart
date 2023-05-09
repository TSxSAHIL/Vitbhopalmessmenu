import 'package:flutter/material.dart';

class Block2 extends StatelessWidget {
  final Map<String, List<String>> menu = {
    'Monday': [
      'Breakfast: Idly , Sambhar , Midhu Vada',
      'Lunch: Rajma Chawal , Rice , Roti',
      'Snacks: Vada Pav & Tea',
      'Dinner: Egg Bhurji Masala , Rice , Roti'
    ],
    'Tuesday': [
      'Breakfast: Veg Parantha ,  MixVeg & Tea ',
      'Lunch: Chole Masala , Poori , Rice , Curd , Roti',
      'Snacks: BhelPuri & Tea',
      'Dinner: Soya Chunks , Halwa , Masala Dal , Rice , Roti'
    ],
    'Wednesday': [
      'Breakfast: Uthappam & Tea',
      'Lunch: Veg Hariyali , Palak Sabji & Curd Rice',
      'Snacks: Pani Poori',
      'Dinner: Butter Paneer , Capsicum Chicken , Rice , Roti'
    ],
    'Thursday': [
      'Breakfast: Poha , Jalebi',
      'Lunch: Navratan Korma , Veg Pulao, ButterMilk ',
      'Snacks: SweetCorn Salad & Tea',
      'Dinner: Green Peas Masala , Egg Curry , Rice , Roti'
    ],
    'Friday': [
      'Breakfast: Chole Bhature',
      'Lunch: Veg Biryani , Raita , Masala Dal , Roti',
      'Snacks: Cake/Patties & Tea',
      'Dinner: Kadhai Paneer , Butter Chicken , Rice , Roti'
    ],
    'Saturday': [
      'Breakfast: Pav Bhaji',
      'Lunch: Chana Dal , Baigan Bharta ,Sambhar , Rice , Roti',
      'Snacks: Samosa & Tea',
      'Dinner: Gobi Manchurian , Fried Rice , Rice , Roti'
    ],
    'Sunday': [
      'Breakfast: Masala Dosa',
      'Lunch: Paneer & Chicken Biryani , Vegetable Raita',
      'Snacks: Dhokla & Tea',
      'Dinner: Dal Makhani ,Tinda Aloo , Rice , Roti '
    ]
  };

  final List<String> dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  String getCurrentDayName() {
    return dayNames[DateTime.now().weekday - 1];
  }

  List<String> getCurrentMenu() {
    String currentDayName = getCurrentDayName();
    return menu[currentDayName]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Text(
              'Menu for Today (${getCurrentDayName()})',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 26.0),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  String mealType = '';
                  String mealName = '';
                  switch (index) {
                    case 0:
                      mealType = 'Breakfast';
                      mealName = getCurrentMenu()[0].substring(11);
                      break;
                    case 1:
                      mealType = 'Lunch';
                      mealName = getCurrentMenu()[1].substring(7);
                      break;
                    case 2:
                      mealType = 'Snacks';
                      mealName = getCurrentMenu()[2].substring(8);
                      break;
                    case 3:
                      mealType = 'Dinner';
                      mealName = getCurrentMenu()[3].substring(8);
                      break;
                  }
                  return ExpansionTile(
                    title: Text(
                      mealType,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          mealName,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}