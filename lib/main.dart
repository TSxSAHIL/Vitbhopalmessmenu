// ignore_for_file: unused_import
//Libraries
import 'package:flutter/material.dart';
import 'package:messmenu/Screens/AboutPage.dart';
import 'package:messmenu/Screens/Block1&2.dart';
import 'package:messmenu/Screens/Splashscreen.dart';
import 'Screens/BoysMenuScreen.dart';
import 'Screens/GirlsMenuScreen.dart';


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
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
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
class _HomeScreenState extends State<HomeScreen> {
  bool isBoysContainerHovered = false;
  bool isGirlsContainerHovered = false;
  bool isDarkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu App',
      theme: ThemeData(
        brightness: isDarkThemeEnabled ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
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
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
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
                    padding: const EdgeInsets.all(19.0),
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
