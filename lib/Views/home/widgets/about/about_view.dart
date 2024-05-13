// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 80,
              height: 0.9,
            ),
          ),
          SizedBox(height: 30),
          Text(
            """ "Unveil the Playfair Cipher's Enigmatic Brilliance" Unlock the fascinating inner workings of this historic encryption method that revolutionized cryptography in the 19th century. Through this in-depth report, unravel the clever 5x5 grid system, innovative digraph substitution rules, and the cipher's remarkable resistance to frequency analysis attacks that stumped codebreakers of its time. Discover the strategic genius behind the Playfair cipher's design and its lasting impact on the evolution of modern cryptography.""",
            style: TextStyle(fontSize: 21, height: 1.5),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text(
                  'Open the report',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://abdulrhman-a1.github.io/PdfVeiwer/'; // Replace this with your URL
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
