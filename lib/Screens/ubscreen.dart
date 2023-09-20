import 'package:flutter/material.dart';
import 'cart_item.dart';

class UbScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(List<CartItem>) onCartItemsUpdated;

  const UbScreen({
    Key? key,
    required this.cartItems,
    required this.onCartItemsUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.dish.name),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cartItems.removeAt(index);
                      onCartItemsUpdated(cartItems);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle order placement
              },
              child: Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }
}
