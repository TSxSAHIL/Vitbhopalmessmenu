import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;
  const CartScreen({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [];

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
      if (item['quantity'] == 1) {
        _cartItems.removeAt(index);
      } else {
        item['quantity'] = (item['quantity'] ?? 1) - 1;
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
      body: _cartItems.isEmpty
          ? Center(
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

                return ListTile(
                  title: Text(itemName),
                  subtitle: Text('Price: $itemPrice'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => decreaseItemCount(index),
                        icon: Icon(Icons.remove),
                      ),
                      Text('$itemQuantity'),
                      IconButton(
                        onPressed: () => increaseItemCount(index),
                        icon: Icon(Icons.add),
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xff1D267D),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Total Amount: Rs. ${getTotalAmount().toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
