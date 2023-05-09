import 'package:flutter/material.dart';
import 'package:messmenu/Screens/Block2.dart';
import 'package:messmenu/Screens/BoysMenuScreen.dart';
import 'package:messmenu/Screens/GirlsMenuScreen.dart';

class Block12 extends StatelessWidget {
  const Block12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boys Hostel Menu"),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoysMenuScreen()),
                );
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff1D267D),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Block 1",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Block2()),
                );
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff1D267D),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Block 2",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
