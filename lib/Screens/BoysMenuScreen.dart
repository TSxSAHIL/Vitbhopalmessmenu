import 'package:flutter/material.dart';

class BoysMenuScreen extends StatelessWidget {
  final Map<String, List<String>> menu = {
    'Monday': [      'Breakfast: Sandwich',      'Lunch: Veg Pulao',      'Snacks: Bread Pakoda',      'Dinner: Rajma Chawal'    ],
    'Tuesday': [      'Breakfast: Poha',      'Lunch: Paneer Butter Masala',      'Snacks: Samosa',      'Dinner: Roti Sabzi'    ],
    'Wednesday': [      'Breakfast: Aloo Paratha',      'Lunch: Dal Tadka',      'Snacks: Maggi',      'Dinner: Chhole Bhature'    ],
    'Thursday': [      'Breakfast: Upma',      'Lunch: Rajasthani Kadhi',      'Snacks: Aloo Tikki',      'Dinner: Veg Biryani'    ],
    'Friday': [      'Breakfast: Idli Sambhar',      'Lunch: Veg Fried Rice',      'Snacks: Dhokla',      'Dinner: Chilli Paneer'    ],
    'Saturday': [      'Breakfast: Poori Sabzi',      'Lunch: Palak Paneer',      'Snacks: Bread Cutlet',      'Dinner: Veg Handi'    ],
    'Sunday': [      'Breakfast: Masala Dosa',      'Lunch: Dum Aloo',      'Snacks: Chana Chaat',      'Dinner: Mix Veg Curry'    ]
  };

  final List<String> dayNames = [    'Monday',    'Tuesday',    'Wednesday',    'Thursday',    'Friday',    'Saturday',    'Sunday'  ];

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
        title: const Text('Boys Mess Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu for Today (${getCurrentDayName()})',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Breakfast',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            getCurrentMenu()[0].substring(11),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Lunch',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            getCurrentMenu()[1].substring(7),
                            style:const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Snacks',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            getCurrentMenu()[2].substring(8),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Dinner',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            getCurrentMenu()[3].substring(8),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
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
