// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:messmenu/Screens/Block2.dart';
import 'package:messmenu/Screens/BoysMenuScreen.dart';
import 'package:messmenu/Screens/GirlsMenuScreen.dart';
import 'package:messmenu/Screens/NightCanteen.dart';
import 'CartScreen.dart';
class Block12 extends StatelessWidget {
  const Block12({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Boys Hostel Menu"),
        
          backgroundColor: const Color(0xff1D267D),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Block 1'),
              Tab(text: 'Block 2'),
              Tab(text: 'Night Canteen',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BoysMenuScreen(),
            Block2(),
            NightCanteen(),
          ],
        ),
      ),
    );
  }
}
