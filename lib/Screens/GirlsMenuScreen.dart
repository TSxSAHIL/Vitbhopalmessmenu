import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GirlsMenuScreen extends StatefulWidget {
  @override
  _GirlsMenuScreenState createState() => _GirlsMenuScreenState();
}

class _GirlsMenuScreenState extends State<GirlsMenuScreen> {
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

  List<String> getMenuForDate(DateTime date) {
    final String dayName = DateFormat('EEEE').format(date);
    return menu[dayName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> currentMenu = getMenuForDate(selectedDate);
    final Brightness brightness = Theme.of(context).brightness;
    final Color textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Girls Mess Menu'),
        backgroundColor: const Color(0xff0C134F),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Menu for Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
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
                        color: textColor,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          mealName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: textColor,
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
