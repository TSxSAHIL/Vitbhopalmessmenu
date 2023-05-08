import 'package:flutter/material.dart';

class GirlsMenuScreen extends StatelessWidget {
  const GirlsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Girls Mess Menu"),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: const Center(
        child: Text("This is the mess menu screen."),
      ),
    );
  }
}