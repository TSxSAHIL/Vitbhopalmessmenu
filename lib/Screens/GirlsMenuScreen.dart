import 'package:flutter/material.dart';

class GirlsMenuScreen extends StatelessWidget {
  final Map<String, List<String>> menu = {
    'Monday': [
      'Breakfast: Idly , Sambhar , Midhu Vada',
      'Lunch: Rajma Chawal , Rice , Roti , Buttermilk',
      'Snacks: Aloo Chat & Tea',
      'Dinner: Egg Bhurji Masala ,Rajasthani Bhindi , Rice , Roti'
    ],
    'Tuesday': [
      'Breakfast: Poha , Uppuma , Jalebi , Banana',
      'Lunch: Mix Veg , Plain Rice , Masoor Dal , Roti , Curd',
      'Snacks: Pani Poori & Tea',
      'Dinner: Roti , Jeera Rice , Choley , Plain Dal'
    ],
    'Wednesday': [
      'Breakfast: Pav Bhaji',
      'Lunch: Dal Tadka , Rice , Roti , Veg Koftha',
      'Snacks: Kachori / Chenna & Tea',
      'Dinner: Dal Tadka , Chicken 65 , Paneer Bhurji , Rice & Roti'
    ],
    'Thursday': [
      'Breakfast: Pongal , Vad , Sambhar ,Banana',
      'Lunch: Dum Aloo , Mix dal , Roti , Ghee Rice',
      'Snacks: Chowmin & Tea',
      'Dinner: Sweet Corn Soup , Aloo Gobhi , Egg Bhurji , Rice , Roti'
    ],
    'Friday': [
      'Breakfast: Chole Bhature',
      'Lunch: Peas Masala , Masala Dal , Rice , Roti',
      'Snacks: Papadi Chat & Tea',
      'Dinner: Chilly Paneer , Butter Chicken , Rice , Roti'
    ],
    'Saturday': [
      'Breakfast: Masala Dosa',
      'Lunch: Masoor Dal , Kaju Rice , Kadhai Chole , Curd',
      'Snacks: Onion Pakoda & Tea ',
      'Dinner: Veg Manchurian , Fried Rice , Rice , Roti'
    ],
    'Sunday': [
      'Breakfast: Paneer Parantha ',
      'Lunch: Paneer & Chicken Biryani , Boondi Raita',
      'Snacks: Samosa',
      'Dinner: Kadi Pakoda , Gulab Jamun , Roti , Rice '
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
