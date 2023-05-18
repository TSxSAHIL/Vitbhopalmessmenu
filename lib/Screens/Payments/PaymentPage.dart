import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isUPIExpanded = false;
  bool _isWalletsExpanded = false;
  bool _isNetbankingExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        backgroundColor: Color(0xff1D267D),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select Payment Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (index == 0) {
                    _isUPIExpanded = !isExpanded;
                  } else if (index == 1) {
                    _isWalletsExpanded = !isExpanded;
                  } else if (index == 2) {
                    _isNetbankingExpanded = !isExpanded;
                  }
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('UPI'),
                    );
                  },
                  body: Column(
                    children: [
                      PaymentOption(
                        icon: Icons.payment,
                        title: 'Paytm',
                        onTap: () {
                          // Perform Paytm payment
                          _performPayment(context, 'Paytm');
                        },
                      ),
                      PaymentOption(
                        icon: Icons.payment,
                        title: 'Google Pay',
                        onTap: () {
                          // Perform Google Pay payment
                          _performPayment(context, 'Google Pay');
                        },
                      ),
                      PaymentOption(
                        icon: Icons.payment,
                        title: 'PhonePe',
                        onTap: () {
                          // Perform PhonePe payment
                          _performPayment(context, 'PhonePe');
                        },
                      ),
                    ],
                  ),
                  isExpanded: _isUPIExpanded,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text('Wallets'),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        PaymentOption(
                          icon: Icons.account_balance_wallet,
                          title: 'Airtel Wallet',
                          onTap: () {
                            // Perform Airtel Wallet payment
                            _performPayment(context, 'Airtel Wallet');
                          },
                        ),
                        PaymentOption(
                          icon: Icons.account_balance_wallet,
                          title: 'Paytm Wallet',
                          onTap: () {
                            // Perform Paytm Wallet payment
                            _performPayment(context, 'Paytm Wallet');
                          },
                        ),
                        PaymentOption(
                          icon: Icons.account_balance_wallet,
                          title: 'Amazon Pay',
                          onTap: () {
                            // Perform Amazon Pay payment
                            _performPayment(context, 'Amazon Pay');
                          },
                        ),
                        PaymentOption(
                          icon: Icons.account_balance_wallet,
                          title: 'Ola Money',
                          onTap: () {
                            // Perform Ola Money payment
                            _performPayment(context, 'Ola Money');
                          },
                        ),
                        PaymentOption(
                          icon: Icons.account_balance_wallet,
                          title: 'PhonePe',
                          onTap: () {
                            // Perform PhonePe payment
                            _performPayment(context, 'PhonePe');
                          },
                        ),
                      ],
                    ),
                  ),
                  isExpanded: _isWalletsExpanded,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text('Netbanking'),
                    );
                  },
                  body: Column(
                    children: [
                      PaymentOption(
                        icon: Icons.account_balance,
                        title: 'Bank 1',
                        onTap: () {
                          // Perform Netbanking payment for Bank 1
                          _performPayment(context, 'Bank 1');
                        },
                      ),
                      PaymentOption(
                        icon: Icons.account_balance,
                        title: 'Bank 2',
                        onTap: () {
                          // Perform Netbanking payment for Bank 2
                          _performPayment(context, 'Bank 2');
                        },
                      ),
                      // Add more netbanking options as needed
                    ],
                  ),
                  isExpanded: _isNetbankingExpanded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performPayment(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('You have selected $paymentMethod for payment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showPaymentSuccessDialog(context);
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Thank you for your payment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Navigate back to the previous screen or perform any necessary actions
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PaymentOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
