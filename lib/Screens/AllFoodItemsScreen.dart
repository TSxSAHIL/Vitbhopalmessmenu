import 'package:flutter/material.dart';
import 'package:messmenu/Screens/CollegeCanteenScreen.dart';

class AllFoodItemsScreen extends StatelessWidget {
  const AllFoodItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Food Items'),
        backgroundColor: const Color(0xff0C134F),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        padding: EdgeInsets.all(16.0),
        children: const [
          FoodItem(
            imagePath: 'assets/pizza.jpg',
            name: 'Pizza',
          ),
          FoodItem(
            imagePath: 'assets/burger.jpg',
            name: 'Burgers',
          ),
          FoodItem(
            imagePath: 'assets/shake.jpg',
            name: 'Shakes',
          ),
          FoodItem(
            imagePath: 'assets/biryani.jpg',
            name: 'Biryani',
          ),
          FoodItem(
            imagePath: 'assets/paneer.jpg',
            name: 'Paneer',
          ),
          // Add more food items as needed
        ],
      ),
    );
  }
}
