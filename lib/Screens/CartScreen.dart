import 'package:flutter/material.dart';
//Cart Screen
class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;
  const CartScreen({Key? key, required this.selectedItems}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [];

  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    cartItems = List<Map<String, dynamic>>.from(widget.selectedItems);
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    for (final item in cartItems) {
      final double itemPrice = double.parse(item['price'].substring(4));
      final int quantity = item['quantity'] ?? 1;
      totalAmount += itemPrice * quantity;
    }
  }

  void increaseQuantity(int index) {
    setState(() {
      final item = cartItems[index];
      if (item['quantity'] != null) {
        cartItems[index]['quantity'] +=1;// item['quantity'] + 1;
        final double itemPrice = double.parse(item['price'].substring(4));
        totalAmount += itemPrice; // Increment the total amount
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xff1D267D),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item['item']),
            subtitle: Text(item['price']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      final item = cartItems[index];
                      if (item['quantity'] != null && item['quantity'] > 1) {
                        cartItems[index]['quantity'] = item['quantity'] - 1;
                        final double itemPrice = double.parse(item['price'].substring(4));
                        totalAmount -= itemPrice; // Decrement the total amount
                      }
                    });
                  },
                ),
                Text(item['quantity']?.toString() ?? '1'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    increaseQuantity(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total Amount: Rs. ${totalAmount.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}