import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'ubscreen.dart';

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
        builder: (context) => UbScreen(cartItems: cartItems, onCartItemsUpdated: navigateToCartScreen),
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
                'Menu ',
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
                MenuItem(name: 'Dosa', rate: 5.99),
                MenuItem(name: 'Idli', rate: 3.99),
                MenuItem(name: 'Vada', rate: 2.99),
              ],
              onCartItemsUpdated: navigateToCartScreen,
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableCard(
              title: 'Sandwich',
              dishes: [
                MenuItem(name: 'Veg Sandwich', rate: 4.99),
                MenuItem(name: 'Grilled Cheese Sandwich', rate: 5.99),
                MenuItem(name: 'Club Sandwich', rate: 6.99),
              ],
              onCartItemsUpdated: navigateToCartScreen,
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableCard(
              title: 'Veg Starters',
              dishes: [
                MenuItem(name: 'Paneer Tikka', rate: 7.99),
                MenuItem(name: 'Vegetable Pakora', rate: 4.99),
                MenuItem(name: 'Crispy Corn', rate: 6.99),
              ],
              onCartItemsUpdated: navigateToCartScreen,
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

class MenuItem {
  final String name;
  final double rate;

  MenuItem({
    required this.name,
    required this.rate,
  });
}

class ExpandableCard extends StatefulWidget {
  final String title;
  final List<MenuItem> dishes;
  final Function(List<CartItem>) onCartItemsUpdated; // New line

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.dishes,
    required this.onCartItemsUpdated, // Updated line
  }) : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;
  List<CartItem> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            ),
            if (_isExpanded)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.dishes.map((dish) {
                    return ListTile(
                      title: Text(
                        dish.name,
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _cartItems.add(CartItem(name: dish.name, rate: dish.rate));
                          });

                          widget.onCartItemsUpdated(_cartItems); // Updated line
                        },
                        child: Text('Add'),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

