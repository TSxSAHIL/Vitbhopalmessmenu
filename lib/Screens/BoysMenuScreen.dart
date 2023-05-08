import 'package:flutter/material.dart';
class BoysMenuScreen extends StatelessWidget {
  const BoysMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mess Menu"),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: const Center(
        child: Text("This is the mess menu screen."),
      ),
    );
  }
}
