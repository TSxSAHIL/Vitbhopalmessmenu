import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  final String _name = 'Sahil Arora';
  final String _email = 'codecraftepics@gmail.com';
  final String _linkedinUrl =
      'https://https://www.linkedin.com/in/sahil-arora-472415209/';
  final String _githubUrl = 'https://https://github.com/TSxSAHIL';
  final String _instagramUrl =
      'https://www.instagram.com/being.sahil23/';

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  Widget _buildClickableText(String text, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
        backgroundColor: const Color(0xff1D267D),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Food.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            ),
            color: const Color.fromRGBO(0, 0, 0, 0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'VIT Bhopal Mess Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Description ",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  "The VIT Bhopal Mess Menu app displays today's menu for both boys and girls hostels as well as the canteen menu. Stay up to date with what's on the menu and plan your meals accordingly with this easy-to-use app. The app features a simple and user-friendly interface that displays the menu items for breakfast, lunch, snacks, and dinner. Additionally, the app provides a separate section for the canteen menu, which includes a variety of food options and beverages.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                 Text(
                  'Version 1.0.9',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Developed by : $_name',
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                const SizedBox(height: 8.0),
                const SizedBox(height: 16.0),
                Text(
                  'Contact us at:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
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
      ),
    );
  }
}
