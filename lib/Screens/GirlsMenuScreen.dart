import 'package:flutter/material.dart';

class GirlsMenuScreen extends StatelessWidget {
  final Map<String, List<String>> menu = {
    'Monday': [
      'Breakfast: Sandwich',
      'Lunch: Veg Pulao',
      'Snacks: Bread Pakoda',
      'Dinner: Rajma Chawal'
    ],
    'Tuesday': [
      'Breakfast: Poha',
      'Lunch: Paneer Butter Masala',
      'Snacks: Samosa',
      'Dinner: Roti Sabzi'
    ],
    'Wednesday': [
      'Breakfast: Aloo Paratha',
      'Lunch: Dal Tadka',
      'Snacks: Maggi',
      'Dinner: Chhole Bhature'
    ],
    'Thursday': [
      'Breakfast: Upma',
      'Lunch: Rajasthani Kadhi',
      'Snacks: Aloo Tikki',
      'Dinner: Veg Biryani'
    ],
    'Friday': [
      'Breakfast: Idli Sambhar',
      'Lunch: Veg Fried Rice',
      'Snacks: Dhokla',
      'Dinner: Chilli Paneer'
    ],
    'Saturday': [
      'Breakfast: Poori Sabzi',
      'Lunch: Palak Paneer',
      'Snacks: Bread Cutlet',
      'Dinner: Veg Handi'
    ],
    'Sunday': [
      'Breakfast: Masala Dosa',
      'Lunch: Dum Aloo',
      'Snacks: Chana Chaat',
      'Dinner: Mix Veg Curry'
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
      appBar: AppBar(
        title: const Text('Girls Mess Menu'),
        backgroundColor: Color(0xff1D267D),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text(
              'Menu for Today (${getCurrentDayName()})',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
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
