import 'package:flutter/material.dart';

class CollegeCanteenScreen extends StatelessWidget {
  const CollegeCanteenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("College Canteen"),
        backgroundColor: const Color(0xff0C134F),
      ),
      body: Center(
        child: Text(
          "College Canteen Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
