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
      title: 'Starters',
      items: [
        MenuItem(
          name: 'Veg Noodles',
          price: 130,
        ),
        MenuItem(
          name: 'Veg Fried Rice',
          price: 130,
        ),
        MenuItem(
          name: 'Chicken Noodles',
          price: 150,
        ),
        MenuItem(
          name: 'Chicken Fried Rice',
          price: 150,
        ),
        MenuItem(
          name: 'Chicken Biryani',
          price: 180,
        ),
        MenuItem(
          name: 'Jeera Rice',
          price: 130,
        ),
        MenuItem(
          name: 'Veg Biryani',
          price: 160,
        ),
        MenuItem(
          name: 'Veg Schezwan Noodles',
          price: 131,
        ),
        MenuItem(
          name: 'Schezwan Veg Fried Rice',
          price: 131,
        ),
        MenuItem(
          name: 'Schezwan Chicken Fried Rice',
          price: 152,
        ),
        MenuItem(
          name: 'Paneer Fried Rice',
          price: 160,
        ),
        MenuItem(
          name: 'Paneer Noodles',
          price: 160,
        ),
        MenuItem(
          name: 'Schezwan Chicken Noodles',
          price: 152,
        ),
        MenuItem(
          name: 'Egg Noodles',
          price: 142,
        ),
        MenuItem(
          name: 'Egg Fried Rice',
          price: 142,
        ),
      ],
    ),
    MenuSection(
  title: 'Indian Gravy',
  items: [
    MenuItem(name: 'Paneer Butter Masala', price: 158),
    MenuItem(name: 'Kadai Paneer Masala', price: 147),
    MenuItem(name: 'Paneer Tikka Masala', price: 158),
    MenuItem(name: 'Shahi Paneer Masala', price: 147),
    MenuItem(name: 'Chicken Tikka Masala', price: 168),
    MenuItem(name: 'Schezwan Chicken Gravy', price: 168),
    MenuItem(name: 'Dal Makhani', price: 150),
    MenuItem(name: 'Kadai Sabji', price: 130),
    MenuItem(name: 'Punjabi Chicken Masala', price: 140),
    MenuItem(name: 'Hyderabadi Chicken Masala', price: 168),
    MenuItem(name: 'Butter Chicken Masala', price: 168),
    MenuItem(name: 'Chicken Lababdar', price: 168),
    MenuItem(name: 'Dhanya Murga Adraki Masala', price: 168),
    MenuItem(name: 'Chicken Keema Masala', price: 168),
    MenuItem(name: 'Dahi Murga', price: 168),
  ],
),
MenuSection(
  title: 'Indian Breads',
  items: [
    MenuItem(name: 'Tandoori Roti', price: 30),
    MenuItem(name: 'Tandoori Butter Roti', price: 35),
    MenuItem(name: 'Tandoori Aloo', price: 55),
    MenuItem(name: 'Tandoori Lachha Parantha', price: 47),
    MenuItem(name: 'Butter Naan', price: 42),
    MenuItem(name: 'Naan', price: 37),
    MenuItem(name: 'Garlic Naan', price: 45),
  ],
),

MenuSection(
  title: 'Sandwich',
  items: [
    MenuItem(name: 'Double Cheese Sandwich', price: 89),
    MenuItem(name: 'Sweet Corn Sandwich', price: 89),
    MenuItem(name: 'Paneer Tikka Sandwich', price: 100),
    MenuItem(name: 'Chicken Tikka Sandwich', price: 121),
    MenuItem(name: 'Mushroom Cheese Sandwich', price: 100),
    MenuItem(name: 'Classic Chicken Club Sandwich', price: 121),
    MenuItem(name: 'Cheese Mayo Grilled Chicken Sandwich', price: 110),
    MenuItem(name: 'Bombay Grill Sandwich', price: 68),
    MenuItem(name: 'Veg Cheese Burger', price: 95),
    MenuItem(name: 'Chicken Burger', price: 116),
    MenuItem(name: 'Veg Wrap', price: 95),
    MenuItem(name: 'Chicken Wrap', price: 121),
    MenuItem(name: 'Paneer Wrap', price: 100),
  ],
),
MenuSection(
  title: 'Egg Varieties',
  items: [
    MenuItem(name: 'Bread Omlette', price: 63),
    MenuItem(name: 'Masala Omlette', price: 37),
    MenuItem(name: 'Cheese Omlette', price: 53),
    MenuItem(name: 'Egg Bhurji', price: 37),
  ],
),
MenuSection(
  title: 'Non Veg Starters',
  items: [
    MenuItem(name: 'Chicken Nuggets', price: 152),
    MenuItem(name: 'Chicken Wings', price: 152),
    MenuItem(name: 'Chicken Tikka', price: 168),
    MenuItem(name: 'Chicken Malai Kabab', price: 163),
    MenuItem(name: 'Tandoori Chicken Half', price: 210),
    MenuItem(name: 'Tandoori Chicken Full', price: 399),
    MenuItem(name: 'Chilli Chicken Dry', price: 140),
    MenuItem(name: 'Chilli Chicken Gravy', price: 150),
    MenuItem(name: 'Dragon Chicken', price: 152),
    MenuItem(name: 'Chicken 65', price: 152),
  ],
),

MenuSection(
  title: 'Veg Starters',
  items: [
    MenuItem(name: 'Classic French Fries', price: 95),
    MenuItem(name: 'Masala French Fries', price: 105),
    MenuItem(name: 'Veg Cheese Fingers', price: 115),
    MenuItem(name: 'Paneer Tikka', price: 158),
    MenuItem(name: 'Paneer Malai Tikka', price: 158),
    MenuItem(name: 'Chilly Paneer Dry', price: 130),
    MenuItem(name: 'Chilly Paneer Gravy', price: 131),
    MenuItem(name: 'Veg Manchurian', price: 137),
    MenuItem(name: 'Mushroom Chilly', price: 137),
    MenuItem(name: 'Paneer 65', price: 140),
    MenuItem(name: 'Mushroom 65', price: 140),
    MenuItem(name: 'Honey Chilli Potato', price: 140),
  ],
),
MenuSection(
  title: 'Momos',
  items: [
    MenuItem(name: 'Veg Momos', price: 105),
    MenuItem(name: 'Paneer Momos', price: 126),
    MenuItem(name: 'Chicken Momos', price: 137),
  ],
),
MenuSection(
  title: 'Non Veg Pasta',
  items: [
    MenuItem(name: 'Penne Alfredo Chicken (Small)', price: 127),
    MenuItem(name: 'Penne Alfredo Chicken (Large)', price: 179),
    MenuItem(name: 'Penne Arabiata Chicken (Small)', price: 127),
    MenuItem(name: 'Penne Arabiata Chicken (Large)', price: 179),
    MenuItem(name: 'Pink Sauce Chicken Pasta (Small)', price: 127),
    MenuItem(name: 'Pink Sauce Chicken Pasta (Large)', price: 179),
    MenuItem(name: 'Basil Sauce Chicken Pasta (Small)', price: 127),
    MenuItem(name: 'Basil Sauce Chicken Pasta (Large)', price: 179),
  ],
),
MenuSection(
  title: 'Veg Pasta',
  items: [
    MenuItem(name: 'Penne Alfredo Pasta (Small)', price: 105),
    MenuItem(name: 'Penner Alfredo Pasta (Large)', price: 168),
    MenuItem(name: 'Penne Arabiate (Small)', price: 105),
    MenuItem(name: 'Penne Arabiate (Large)', price: 168),
    MenuItem(name: 'Pink Sauce Pasta (Small)', price: 105),
    MenuItem(name: 'Pink Sauce Pasta (Large)', price: 168),
    MenuItem(name: 'Basil Sauce Pasta (Small)', price: 105),
    MenuItem(name: 'Basil Sauce Pasta (Large)', price: 168),
  ],
),


    MenuSection(
      title: 'Bakery Items',
      items: [
        MenuItem(
          name: 'Veg Plater',
          price: 45,
        ),
        MenuItem(
          name: 'Veg Sub Roll',
          price: 42,
        ),
        MenuItem(
          name: 'Veg TurnOver',
          price: 45,
        ),
        MenuItem(
          name: 'Chilly Cheese Plater',
          price: 50,
        ),
        MenuItem(
          name: 'Paneer Pizza Bun',
          price: 50,
        ),
        MenuItem(
          name: 'Veg Crispy Roll',
          price: 50,
        ),
        MenuItem(
          name: 'Chicken Turnover',
          price: 50,
        ),
        MenuItem(
          name: 'Chicken Pizza Bun',
          price: 50,
        ),
        MenuItem(
          name: 'Chicken Sub Roli',
          price: 50,
        ),
        MenuItem(
          name: 'Chicken Plater',
          price: 53,
        ),
        MenuItem(
          name: 'Egg Turnover',
          price: 40,
        ),
      ],
    ),
    MenuSection(
  title: 'Shakes',
  items: [
    MenuItem(
      name: 'Butterscotch Milkshake (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Vanilla Milkshake (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Chocolate Milkshake (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Oreo Milkshake (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Kitkat Milkshake (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Butterscotch Milkshake (Large)',
      price: 80,
    ),
    MenuItem(
      name: 'Vanilla Milkshake (Large)',
      price: 80,
    ),
    MenuItem(
      name: 'Chocolate Milkshake (Large)',
      price: 80,
    ),
    MenuItem(
      name: 'Oreo Milkshake (Large)',
      price: 95,
    ),
    MenuItem(
      name: 'Kitkat Milkshake (Large)',
      price: 95,
    ),
    MenuItem(
      name: 'Cold Coffee (Small)',
      price: 50,
    ),
    MenuItem(
      name: 'Strawberry Milkshake (Small)',
      price: 79,
    ),
    MenuItem(
      name: 'Strawberry Milkshake (Large)',
      price: 42,
    ),
    MenuItem(
      name: 'Snickers Milkshake (Small)',
      price: 90,
    ),
    MenuItem(
      name: 'Snickers Milkshake (Large)',
      price: 50,
    ),
    MenuItem(
      name: 'Cold Coffee (Large)',
      price: 80,
    ),
  ],
),
MenuSection(
  title: 'Fresh Juice',
  items: [
    MenuItem(
      name: 'Orange Juice',
      price: 70,
    ),
    MenuItem(
      name: 'Sweet Lime Juice',
      price: 70,
    ),
    MenuItem(
      name: 'Pineapple Juice',
      price: 70,
    ),
    MenuItem(
      name: 'Mango Juice',
      price: 70,
    ),
    MenuItem(
      name: 'Lemon Ice Tea (Large)',
      price: 70,
    ),
    MenuItem(
      name: 'Lemon Ice Tea (Small)',
      price: 42,
    ),
    MenuItem(
      name: 'Lime Mint Cooler (Small)',
      price: 42,
    ),
    MenuItem(
      name: 'Lime Mint Cooler (Large)',
      price: 70,
    ),
  ],
),
MenuSection(
  title: 'Cakes & Pastry',
  items: [
    MenuItem(name: 'Choco Truffle (500 g)', price: 500),
    MenuItem(name: 'Kitkat Cake (500 g)', price: 550),
    MenuItem(name: 'Oreo Cake (500 g)', price: 550),
    MenuItem(name: 'Choclate Cake (500 g)', price: 500),
    MenuItem(name: 'Butterscotch Cake (500 g)', price: 500),
    MenuItem(name: 'Choco Truffle (1 kg)', price: 500),
    MenuItem(name: 'Kitkat Cake (1 kg)', price: 950),
    MenuItem(name: 'Oreo Cake (1 kg)', price: 1000),
    MenuItem(name: 'Choclate Cake (1 kg)', price: 1000),
    MenuItem(name: 'Butterscotch Cake (1 kg)', price: 900),
    MenuItem(name: 'Oreo Pastry', price: 80),
    MenuItem(name: 'Kitkat Pastry', price: 80),
    MenuItem(name: 'Choco Truffle', price: 80),
    MenuItem(name: 'Blue Berry', price: 80),
    MenuItem(name: 'Swiss Roll', price: 74),
    MenuItem(name: 'Walnut Brownie', price: 74),
    MenuItem(name: 'Choco Doughnut', price: 42),
  ],
),

MenuSection(
      title: 'South Indian',
      items: [
        MenuItem(
          name: 'Masala Dosa',
          price: 80,
        ),
        MenuItem(
          name: 'Butter Masala Dosa',
          price: 90,
        ),
        MenuItem(
          name: 'Plain Dosa',
          price: 70,
        ),
        MenuItem(
          name: 'Ghee Dosa',
          price: 79,
        ),
        MenuItem(
          name: 'Butter Dosa',
          price: 80,
        ),
        MenuItem(
          name: 'Podi Dosa',
          price: 80,
        ),
        MenuItem(
          name: 'Mushroom Kheema Dosa',
          price: 100,
        ),
        MenuItem(
          name: 'Paper Masala Dosa',
          price: 70,
        ),
        MenuItem(
          name: 'Paneer Kheema Dosa',
          price: 105,
        ),
        MenuItem(
          name: 'Cheese Masala Dosa',
          price: 100,
        ),
        MenuItem(
          name: 'Chilly Cheese Garlic Dosa',
          price: 130,
        ),
        MenuItem(
          name: 'Onion Cheese Masala Dosa',
          price: 100,
        ),
        MenuItem(
          name: 'Chilly Garlic Paneer Dosa',
          price: 116,
        ),
        MenuItem(
          name: 'Ghee Sambhar Idlies',
          price: 60,
        ),
      ],
    ),



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
            icon: const Icon(Icons.add),
          ),
        ],
      );
    }
  }
}
