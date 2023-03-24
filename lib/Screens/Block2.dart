// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Block2 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Block2State createState() => _Block2State();
}
class _Block2State extends State<Block2> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  final Map<String, List<String>> menu = {
    // menu of mess
    'Monday': [
      'Breakfast: Idly , Sambhar , Midhu Vada  , Sprouts',
      'Lunch: Rajma Chawal , Jeera Aloo Fry, Rice , Roti',
      'Snacks: Vada Pav / Chivda & Tea',
      'Dinner: Egg Bhurji Masala , Dum Aloo , Rice , Roti'
    ],

    'Tuesday': [
      'Breakfast: Parantha , Sabji , Fruit , Boiled Egg/Sprouts',
      'Lunch: Soya Chunks , Masala Dal , Sambar , Rice , Roti',
      'Snacks: BhelPuri & Tea',
      'Dinner: Chole Masala , Poori, Halwa , Masala Dal , Rice , Roti'
    ],
    'Wednesday': [
      'Breakfast: Uthappam , Sambar , Chutney & Tea',
      'Lunch: Veg Hariyali , Palak Sabji , Sweet Boondi & Curd Rice',
      'Snacks: Pani Poori',
      'Dinner: Butter Paneer , Capsicum Chicken , Rice , Roti'
    ],
    'Thursday': [
      'Breakfast: Poha , Pongal , Jalebi',
      'Lunch: Navratan Korma , Veg Pulao, ButterMilk ',
      'Snacks: SweetCorn Salad/Chana Dal & Tea',
      'Dinner: Green Peas Masala , Egg Curry , Rice , Roti'
    ],
    'Friday': [
      'Breakfast: Vermicelli Upma , Pav Bhaji , Chutney',
      'Lunch: Veg Biryani , Raita , Masala Dal , Roti',
      'Snacks: Cake/Patties/Onion Bhaji & Tea',
      'Dinner: Kadhai Paneer , Butter Chicken , Rice , Roti'
    ],
    'Saturday': [
      'Breakfast: Chole Bhature , Fruit ',
      'Lunch: Chana Dal Khichdi , Baigan Bharta ,Sambhar , Rice , Roti',
      'Snacks: Samosa/Dahi Vada & Tea',
      'Dinner: Gobi Manchurian , Fried Rice/Noodles , Rice , Roti'
    ],
    'Sunday': [
      'Breakfast: Masala Dosa , Chutney , Fruit',
      'Lunch: Paneer & Chicken Biryani , Vegetable Raita',
      'Snacks: Dhokla/Pasta & Tea',
      'Dinner: Dal Makhani ,Tinda Aloo/Patta Gobhi , Rice , Roti '
    ]
  };

  List<String> getMenuForDate(DateTime date) {
    final String dayName = DateFormat('EEEE').format(date);
    return menu[dayName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> currentMenu = getMenuForDate(selectedDate);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Menu for Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, // Use white color for dark theme, black for light theme
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, // Use white color for dark theme, black for light theme
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26.0),
            Expanded(
              child: ListView.builder(
                itemCount: currentMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  final String menuItem = currentMenu[index];
                  final List<String> parts = menuItem.split(':');
                  final String mealType = parts[0].trim();
                  final String mealName = parts[1].trim();

                  return ExpansionTile(
                    title: Text(
                      mealType,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, // Use white color for dark theme, black for light theme
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          mealName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, // Use white color for dark theme, black for light theme
                          ),
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