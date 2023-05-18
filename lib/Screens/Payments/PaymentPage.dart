import 'package:flutter/material.dart';
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        backgroundColor: Color(0xff1D267D),
      ),
      body: Center(
        child: Text(
          'Payment Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
