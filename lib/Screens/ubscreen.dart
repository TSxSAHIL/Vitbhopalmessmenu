import 'package:flutter/material.dart';
import 'cart_item.dart';


class UbScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final Function(List<CartItem>) onCartItemsUpdated; // New line

  const UbScreen({
    Key? key,
    required this.cartItems,
    required this.onCartItemsUpdated, // Updated line
  }) : super(key: key);

  @override
  _UbScreenState createState() => _UbScreenState();
}

class _UbScreenState extends State<UbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.rate.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
