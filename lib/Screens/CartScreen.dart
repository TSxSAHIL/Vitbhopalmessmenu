import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedItems;

  CartScreen({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemCount = selectedItems.length;
    final double totalAmount = selectedItems.fold(
        0, (sum, item) => sum + double.parse(item['price'].substring(4)));

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xff1D267D),
      ),
      body: Column(
        children: [
          if (selectedItems.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  final item = selectedItems[index];
                  return ListTile(
                    title: Text(item['item']),
                    subtitle: Text(item['price']),
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
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    itemCount.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Amount:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rs. ${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
