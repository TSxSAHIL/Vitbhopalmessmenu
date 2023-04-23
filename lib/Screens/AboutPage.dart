import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final String _name = 'Sahil Arora';
  final String _email = 'your-email@example.com';
  final String _linkedinUrl =
      'https://www.linkedin.com/in/your-linkedin-profile';
  final String _githubUrl = 'https://github.com/your-github-profile';
  final String _instagramUrl =
      'https://www.instagram.com/your-instagram-profile';

  Future<void> _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget _buildClickableText(String text, String githubUrl) {
    return InkWell(
      onTap: () => _launchUrl(githubUrl),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Food.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'VIT Bhopal Mess Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 60.0),
              const Text(
                "Description ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "The VIT Bhopal Mess Menu app displays today's menu for both boys and girls hostels as well as the canteen menu. Stay up to date with what's on the menu and plan your meals accordingly with this easy-to-use app. The app features a simple and user-friendly interface that displays the menu items for breakfast, lunch, snacks, and dinner. Additionally, the app provides a separate section for the canteen menu, which includes a variety of food options and beverages.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Version 1.0.1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Developed by : $_name',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              const SizedBox(height: 16.0),
              const Text(
                'Contact us at:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  _buildClickableText('Email', 'mailto:$_email'),
                  const SizedBox(width: 8.0),
                  _buildClickableText('LinkedIn', _linkedinUrl),
                  const SizedBox(width: 8.0),
                  _buildClickableText('GitHub', _githubUrl),
                  const SizedBox(width: 8.0),
                  _buildClickableText('Instagram', _instagramUrl),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
