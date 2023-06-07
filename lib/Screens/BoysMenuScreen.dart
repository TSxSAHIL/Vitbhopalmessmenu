import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoysMenuScreen extends StatefulWidget {
  @override
  _BoysMenuScreenState createState() => _BoysMenuScreenState();
}

class _BoysMenuScreenState extends State<BoysMenuScreen> {
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
    // menu data...
    'Monday': [
      'Breakfast: Idly , Sambhar , Midhu Vada',
      'Lunch: Rajma Chawal , Jeera Aloo Fry , Rice , Roti',
      'Snacks: Vada Pav & Tea',
      'Dinner: Egg Bhurji Masala , Kashmiri Aloo , Rice , Roti'
    ],
    'Tuesday': [
      'Breakfast: Veg Parantha / Poori ,  MixVeg & Tea ',
      'Lunch: Chole Masala , Poori , Sambar , Rice , Curd , Roti',
      'Snacks: BhelPuri , Sauce & Tea',
      'Dinner: Soya Chunks , Kuska , Fruit Custard , Masala Dal , Rice , Roti'
    ],
    'Wednesday': [
      'Breakfast: Uthappam , Sambar & Tea',
      'Lunch: Aloo Corn , Mix Dal ,Palak Sabji & Curd Rice',
      'Snacks: Pani Poori , Tea & Milk',
      'Dinner: Butter Paneer , Capsicum Chicken , Rice , Roti'
    ],
    'Thursday': [
      'Breakfast: Poha , Jalebi , Pongal , Banana',
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
      'Dinner: Dal Makhani ,Tinda Aloo , Gulab Jamun , Rice , Roti '
    ]
  };

  List<String> getMenuForDate(DateTime date) {
    final String dayName = DateFormat('EEEE').format(date);
    return menu[dayName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> currentMenu = getMenuForDate(selectedDate);
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDarkTheme = brightness == Brightness.dark;

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
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                    Icons.calendar_today,
                    color: isDarkTheme ? Colors.white : Colors.black,
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
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          mealName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: isDarkTheme ? Colors.white : Colors.black,
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
