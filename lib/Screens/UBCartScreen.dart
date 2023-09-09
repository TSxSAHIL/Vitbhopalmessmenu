import 'package:flutter/material.dart';
import 'package:messmenu/Screens/NewUB.dart';
class UBCart extends StatefulWidget {
  final List<MenuItem> cartItems;

  const UBCart({Key? key, required this.cartItems}) : super(key: key);

  @override
  _UBCartState createState() => _UBCartState();
}

class _UBCartState extends State<UBCart> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    total = 0;
    for (var item in widget.cartItems) {
      total += item.price * item.quantity;
    }
  }

  void incrementQuantity(MenuItem item) {
    setState(() {
      item.quantity++;
      calculateTotal();
    });
  }

  void decrementQuantity(MenuItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
        calculateTotal();
      }
    });
  }

  void deleteItem(MenuItem item) {
    setState(() {
      widget.cartItems.remove(item);
      calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xff0C134F), // Customize the app bar color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('\Rs ${item.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => decrementQuantity(item),
                        icon: Icon(Icons.remove),
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        onPressed: () => incrementQuantity(item),
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () => deleteItem(item),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, -1), // Add a shadow at the top of the container
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '\Rs ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Order'),
                          content: Text('The total amount for the order is \Rs ${total.toStringAsFixed(2)}.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary:const  Color(0xff0C134F), // Customize the button color
                    textStyle:const  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding:const  EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Round the button edges
                    ),
                  ),
                  icon:const  Icon(Icons.check), // Add an icon to the button
                  label: const Text('Confirm Order'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUB()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary:const  Color(0xff0C134F), // Customize the button color
                    textStyle:const  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Round the button edges
                    ),
                  ),
                  child: const Text('Browse Menu'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
