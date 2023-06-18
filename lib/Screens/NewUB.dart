import 'package:flutter/material.dart';
import 'package:messmenu/Screens/UBCartScreen.dart';

class NewUB extends StatefulWidget {
  const NewUB({Key? key}) : super(key: key);

  @override
  _NewUBState createState() => _NewUBState();
}

class _NewUBState extends State<NewUB> {
  List<MenuSection> menuSections = [
    MenuSection(
      title: 'Appetizers',
      items: [
        MenuItem(
          name: 'Nachos',
          price: 8.99,
        ),
        MenuItem(
          name: 'Chicken Wings',
          price: 10.99,
        ),
      ],
    ),
    MenuSection(
      title: 'Main Course',
      items: [
        MenuItem(
          name: 'Steak',
          price: 20.99,
        ),
        MenuItem(
          name: 'Salmon',
          price: 18.99,
        ),
      ],
    ),
    // Add more sections and items as needed
  ];

  List<MenuItem> cartItems = [];

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UBCart(cartItems: cartItems)),
                  );
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
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UBCart(cartItems: cartItems)),
                      );
                    },
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final section = menuSections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: Text(
                        section.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: section.items.length,
                      itemBuilder: (context, itemIndex) {
                        MenuItem item = section.items[itemIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    CartButton(
                                      item: item,
                                      onAddToCart: () {
                                        setState(() {
                                          item.quantity = 1;
                                          cartItems.add(item);
                                        });
                                      },
                                      onIncrement: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      onDecrement: () {
                                        setState(() {
                                          if (item.quantity > 0) {
                                            item.quantity--;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                '\Rs ${item.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    if (index < menuSections.length - 1)
                      const Divider(
                        indent: 16.0,
                        endIndent: 16.0,
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                  ],
                );
              },
              childCount: menuSections.length,
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
        SizedBox(height: 1),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class MenuSection {
  final String title;
  final List<MenuItem> items;

  MenuSection({
    required this.title,
    required this.items,
  });
}

class MenuItem {
  final String name;
  final double price;
  int quantity;

  MenuItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}

class CartButton extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAddToCart;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartButton({
    Key? key,
    required this.item,
    required this.onAddToCart,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item.quantity == 0) {
      return IconButton(
        onPressed: onAddToCart,
        icon: Icon(Icons.add_shopping_cart),
      );
    } else {
      return Row(
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: Icon(Icons.remove),
          ),
          Text(
            item.quantity.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: Icon(Icons.add),
          ),
        ],
      );
    }
  }
}
