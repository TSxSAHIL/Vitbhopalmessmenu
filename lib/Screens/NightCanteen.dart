import 'package:flutter/material.dart';

import 'CartScreen.dart';

class NightCanteen extends StatefulWidget {
  NightCanteen({Key? key}) : super(key: key);

  @override
  _NightCanteenState createState() => _NightCanteenState();
}

class _NightCanteenState extends State<NightCanteen> {
  final List<Map<String, dynamic>> _menuItems = [
    {'item': 'Bread Omelette', 'price': 'Rs. 45'},
    {'item': 'Plain Omelette', 'price': 'Rs. 35'},
    {'item': 'Onion Omelette', 'price': 'Rs. 40'},
    {'item': 'Boiled Egg', 'price': 'Rs. 10'},
    {'item': 'Paneer Tikka', 'price': 'Rs. 125'},
    {'item': 'Chicken Tikka', 'price': 'Rs. 130'},
    {'item': 'Tandoori Chicken Full', 'price': 'Rs. 450'},
    {'item': 'Tandoori Chicken Half', 'price': 'Rs. 225'},
    {'item': 'Tandoori Chicken Quater', 'price': 'Rs. 115'},
    {'item': 'Chicken-65', 'price': 'Rs. 100'},
    {'item': 'Chilly Chicken', 'price': 'Rs. 130'},
    {'item': 'Butter Chicken Masala', 'price': 'Rs. 150'},
    {'item': 'Kadai Chicken Masala', 'price': 'Rs. 140'},
    {'item': 'Chicken Masala', 'price': 'Rs. 140'},
    {'item': 'Chicken Tikka Masala', 'price': 'Rs. 140'},
    {'item': 'Schezwan Chicken Noodles', 'price': 'Rs. 130'},
    {'item': 'Schezwan Chicken Rice', 'price': 'Rs. 120'},
    {'item': 'Chicken Fried Rice', 'price': 'Rs. 130'},
    {'item': 'Egg Fried Rice', 'price': 'Rs. 120'},
    {'item': 'Egg Noodles', 'price': 'Rs. 120'},
    {'item': 'Chicken Noodles', 'price': 'Rs. 130'},
    {'item': 'Plain Naan', 'price': 'Rs. 25'},
    {'item': 'Garlic Naan', 'price': 'Rs. 35'},
    {'item': 'Butter Naan', 'price': 'Rs. 30'},
    {'item': 'Plain Roti', 'price': 'Rs. 20'},
    {'item': 'Butter Roti', 'price': 'Rs. 30'},
    {'item': 'Butter Paneer Masala', 'price': 'Rs. 140'},
    {'item': 'Kadhai Paneer', 'price': 'Rs. 130'},
    {'item': 'Chilly Paneer', 'price': 'Rs. 130'},
    {'item': 'Veg Noodles', 'price': 'Rs. 110'},
    {'item': 'Schezwan Veg Noodles', 'price': 'Rs. 120'},
    {'item': 'Veg Fried Rice', 'price': 'Rs. 110'},
    {'item': 'Schezwan Veg Fried Rice', 'price': 'Rs. 125'},
    {'item': 'Plain Dosa', 'price': 'Rs. 50'},
    {'item': 'Masala Dosa', 'price': 'Rs. 60'},
    {'item': 'Onion Dosa', 'price': 'Rs. 55'},
    {'item': 'Ghee Dosa', 'price': 'Rs. 60'},
    {'item': 'Egg Dosa', 'price': 'Rs. 60'},
  ];

  List<Map<String, dynamic>> _selectedItems = [];

  bool _sortAscending = true;

  void sortItems() {
    setState(() {
      if (_sortAscending) {
        _menuItems.sort((a, b) {
          double? aPrice = double.tryParse(a['price'].substring(4));
          double? bPrice = double.tryParse(b['price'].substring(4));
          if (aPrice == null) return 1;
          if (bPrice == null) return -1;
          return aPrice.compareTo(bPrice);
        });
      } else {
        _menuItems.sort((a, b) {
          double? aPrice = double.tryParse(a['price'].substring(4));
          double? bPrice = double.tryParse(b['price'].substring(4));
          if (aPrice == null) return 1;
          if (bPrice == null) return -1;
          return bPrice.compareTo(aPrice);
        });
      }
      _sortAscending = !_sortAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            const DataColumn(label: Text('Item')),
            DataColumn(
              label: Row(
                children: [
                  Text('Price'),
                  SortButton(
                    sortAscending: _sortAscending,
                    onPressed: sortItems,
                  ),
                ],
              ),
            ),
            DataColumn(label: Text('Add to Cart')),
          ],
          rows: List<DataRow>.generate(
            _menuItems.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(_menuItems[index]['item'])),
                DataCell(Text(_menuItems[index]['price'])),
                DataCell(
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedItems.add(_menuItems[index]);
                      });
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(selectedItems: _selectedItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    required this.sortAscending,
    required this.onPressed,
  }) : super(key: key);

  final bool sortAscending;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        sortAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down,
      ),
    );
  }
}

