import 'package:flutter/material.dart';
import 'package:messmenu/Screens/ExpandableCard.dart';
import 'package:messmenu/Screens/ubscreen.dart';
import 'cart_item.dart';

class CollegeCanteenScreen extends StatefulWidget {
  const CollegeCanteenScreen({Key? key}) : super(key: key);

  @override
  _CollegeCanteenScreenState createState() => _CollegeCanteenScreenState();
}

class _CollegeCanteenScreenState extends State<CollegeCanteenScreen> {
  List<CartItem> cartItems = [];

  void navigateToCartScreen(List<CartItem> updatedCartItems) {
    setState(() {
      cartItems = updatedCartItems;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UbScreen(
          cartItems: cartItems,
          onCartItemsUpdated: navigateToCartScreen,
        ),
      ),
    );
  }

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
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  navigateToCartScreen(cartItems);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
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
              height: 180,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableCard(
              title: 'South Indian',
              dishes: [
                CollegeMenuItem(name: 'Dosa', rate: 5.99, quantity: 0),
                CollegeMenuItem(name: 'Idli', rate: 3.99, quantity: 0),
                CollegeMenuItem(name: 'Vada', rate: 2.99, quantity: 0),
              ],
              onCartItemAdded: (CartItem cartItem) {
                setState(() {
                  cartItems.add(cartItem);
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableCard(
              title: 'Sandwich',
              dishes: [
                CollegeMenuItem(name: 'Veg Sandwich', rate: 4.99, quantity: 0),
                CollegeMenuItem(
                    name: 'Grilled Cheese Sandwich', rate: 5.99, quantity: 0),
                CollegeMenuItem(name: 'Club Sandwich', rate: 6.99, quantity: 0),
              ],
              onCartItemAdded: (CartItem cartItem) {
                setState(() {
                  cartItems.add(cartItem);
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableCard(
              title: 'Veg Starters',
              dishes: [
                CollegeMenuItem(name: 'Paneer Tikka', rate: 7.99, quantity: 0),
                CollegeMenuItem(
                    name: 'Vegetable Pakora', rate: 4.99, quantity: 0),
                CollegeMenuItem(name: 'Crispy Corn', rate: 6.99, quantity: 0),
              ],
              onCartItemAdded: (CartItem cartItem) {
                setState(() {
                  cartItems.add(cartItem);
                });
              },
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
        SizedBox(height: 8),
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

class CollegeMenuItem {
  final String name;
  final double rate;
  int quantity;

  CollegeMenuItem({
    required this.name,
    required this.rate,
    this.quantity = 0,
  });
}
