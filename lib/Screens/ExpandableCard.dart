import 'package:flutter/material.dart';
import 'package:messmenu/Screens/CollegeCanteenScreen.dart';
import 'cart_item.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final List<CollegeMenuItem> dishes;
  final Function(CartItem) onCartItemAdded;

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.dishes,
    required this.onCartItemAdded,
  }) : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;
  int selectedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: widget.dishes.map((dish) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dish.name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        QuantitySelector(
                          quantity: dish.quantity,
                          onQuantityChanged: (quantity) {
                            setState(() {
                              dish.quantity = quantity;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          if (isExpanded)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final selectedDishes = widget.dishes
                        .where((dish) => dish.quantity > 0)
                        .toList();
                    for (var dish in selectedDishes) {
                      final cartItem = CartItem(dish: dish, quantity: dish.quantity);
                      widget.onCartItemAdded(cartItem);
                    }
                  },
                  child: Text('Add to Cart'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > 0) {
              onQuantityChanged(quantity - 1);
            }
          },
        ),
        Text(
          quantity.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            onQuantityChanged(quantity + 1);
          },
        ),
      ],
    );
  }
}
