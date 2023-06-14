// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmenu/Screens/AllFoodItemsScreen.dart';
class CollegeCanteenScreen extends StatelessWidget {
  const CollegeCanteenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/canteen.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: const Color(0xff0C134F),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 180, // Set a fixed height for the Container
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
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
                  FoodItem(
                    imagePath: 'assets/rolls.jpg',
                    name: 'Rolls',
                  ),
                  FoodItem(
                    imagePath: 'assets/pasta.jpg',
                    name: 'Pasta',
                  ),
                  FoodItem(
                    imagePath: 'assets/cake.jpg',
                    name: 'Cakes',
                  ),
                  // Add more food items as needed
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  // Handle "Explore Whole Menu" button press
                },
                child: Text(
                  'Explore Whole Menu',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String name;

  const FoodItem({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle food item tap
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8), // Add a SizedBox for spacing
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
