import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;

  CartScreen({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [];
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    cartItems = widget.selectedItems;
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    totalAmount = cartItems.fold(
      0,
      (sum, item) => sum + double.parse(item['price'].substring(4)) * (item['quantity'] ?? 1),
    );
  }

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      calculateTotalAmount();
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      final item = cartItems[index];
      if (item['quantity'] != null) {
        cartItems[index]['quantity'] = item['quantity'] + 1;
        final double itemPrice = double.parse(item['price'].substring(4));
        totalAmount += itemPrice; // Increment the total amount
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int itemCount = cartItems.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xff1D267D),
      ),
      body: Column(
        children: [
          if (cartItems.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      deleteItem(index);
                    },
                    background: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16),
                    ),
                    child: ListTile(
                      title: Text(item['item'] ?? ''),
                      subtitle: Text(
                        'Rs. ${item['price'] ?? ''} x ${item['quantity'] ?? 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              increaseQuantity(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  'No items selected.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Items in Cart:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    itemCount.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Amount:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rs. ${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Implement the cart confirmation logic here
                  },
                  child: Text(
                    'Confirm Cart',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
