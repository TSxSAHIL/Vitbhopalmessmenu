// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmenu/Screens/AboutPage.dart';
import 'package:messmenu/Screens/Block1&2.dart';
import 'package:messmenu/Screens/Splashscreen.dart';
import 'package:messmenu/Screens/BoysMenuScreen.dart';
import 'package:messmenu/Screens/GirlsMenuScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(), // Apply custom font
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.latoTextTheme(), // Apply custom font
      ),
      home: const SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isBoysContainerHovered = false;
  bool isGirlsContainerHovered = false;
  bool isDarkThemeEnabled = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu App',
      theme: ThemeData(
        brightness: isDarkThemeEnabled ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(), // Apply custom font
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.latoTextTheme(), // Apply custom font
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("VIT BHOPAL MESS MENU"),
          backgroundColor: const Color(0xff1D267D),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  child: Text('About'),
                  value: 'about',
                ),
              ],
              onSelected: (value) {
                if (value == 'about') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                } else if (value == 'settings') {
                  // handle settings menu item
                }
              },
            ),
            Switch(
              value: isDarkThemeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkThemeEnabled = value;
                });
              },
            ),
          ],
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
                    MaterialPageRoute(builder: (context) => const Block12()),
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(
                      isBoysContainerHovered ? -10.0 : 0.0,
                      0.0,
                      0.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/boys_hostel.jpg',
                            fit: BoxFit.cover,
                          ),
                          if (isBoysContainerHovered)
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.center,
                            child: AnimatedOpacity(
                              opacity: isBoysContainerHovered ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                'Boys Menu',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(
                      isGirlsContainerHovered ? 10.0 : 0.0,
                      0.0,
                      0.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/girls_hostel.jpg',
                            fit: BoxFit.cover,
                          ),
                          if (isGirlsContainerHovered)
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.center,
                            child: AnimatedOpacity(
                              opacity: isGirlsContainerHovered ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                'Girls Menu',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
