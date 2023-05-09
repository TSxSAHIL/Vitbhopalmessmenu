import 'package:flutter/material.dart';

import 'Screens/BoysMenuScreen.dart';
import 'Screens/GirlsMenuScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu App',
      home: HomeScreen(),
    );
  }
}

// Home Screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBoysContainerHovered = false;
  bool isGirlsContainerHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VIT BHOPAL MESS MENU"),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoysMenuScreen()),
                );
              },
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isBoysContainerHovered = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isBoysContainerHovered = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/boys_hostel.jpg'),
                        fit: BoxFit.cover,
                      ),
                      gradient: isBoysContainerHovered
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GirlsMenuScreen()),
                );
              },
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isGirlsContainerHovered = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isGirlsContainerHovered = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/girls_hostel.jpg'),
                        fit: BoxFit.cover,
                      ),
                      gradient: isGirlsContainerHovered
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
