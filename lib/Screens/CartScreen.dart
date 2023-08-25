// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'Payments/PaymentPage.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;
  const CartScreen({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [];
  bool _isCartConfirmed = false; // Add the isCartConfirmed variable

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.selectedItems);
  }

  int getTotalItemCount() {
    return _cartItems.length;
  }

  double getTotalAmount() {
    double total = 0;
    for (var item in _cartItems) {
      double? itemPrice = double.tryParse(item['price'].substring(4));
      int itemQuantity = item['quantity'] ?? 1;
      if (itemPrice != null) {
        total += itemPrice * itemQuantity;
      }
    }
    return total;
  }

  void increaseItemCount(int index) {
    setState(() {
      final item = _cartItems[index];
      item['quantity'] = (item['quantity'] ?? 1) + 1;
    });
  }

  void decreaseItemCount(int index) {
    setState(() {
      final item = _cartItems[index];
      if (item['quantity'] != null) {
        int quantity = item['quantity'];
        if (quantity == 1) {
          _cartItems.removeAt(index);
        } else {
          item['quantity'] = quantity - 1;
        }
      }
    });
  }
  void confirmCart() async {
    _isCartConfirmed = true;
    // Show dialog box
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Items: ${getTotalItemCount()}'),
              const SizedBox(height: 8),
              Text(
                'Total Amount: Rs. ${getTotalAmount().toStringAsFixed(2)}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                setState(() {
                  _isCartConfirmed = false; 
                });
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xff1D267D)),
              ),
            ),
          ],
        );
      },
    );
    setState(() {
      _isCartConfirmed = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color((0xff0C134F)),
      ),
      body: _cartItems.isEmpty
          ? const Center(
              child: Text(
                'Cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                final itemName = item['item'];
                final itemPrice = item['price'];
                final itemQuantity = item['quantity'] ?? 1;
                
                //return Listtile
                return ListTile(
                  title: Text(itemName),
                  subtitle: Text('Price: $itemPrice'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => decreaseItemCount(index),
                        icon: const Icon(Icons.remove),
                      ),
                      Text('$itemQuantity'),
                      IconButton(
                        onPressed: () => increaseItemCount(index),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Total Items: ${getTotalItemCount()}',
        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff0C134F)),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1D267D)
              : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount: Rs. ${getTotalAmount().toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0C134F)
              ),
            ),
            if (!_isCartConfirmed && getTotalAmount() > 0)
              GestureDetector(
                onTap: confirmCart,
                child: Container(
                  padding:const  EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff1D267D),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  ),
),
    );
  }
}
