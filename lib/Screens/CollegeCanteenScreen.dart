import 'package:flutter/material.dart';

class CollegeCanteenScreen extends StatelessWidget {
  const CollegeCanteenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/canteen.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: const Color(0xff0C134F),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text('Menu Option 1'),
                ),
                ListTile(
                  title: Text('Menu Option 2'),
                ),
                
                
                // Add more menu options as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
