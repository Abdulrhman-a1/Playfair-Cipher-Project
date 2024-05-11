import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

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
                fontWeight: FontWeight.w800, fontSize: 80, height: 0.9),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            """ "Unveil the Playfair Cipher's Enigmatic Brilliance" Unlock the fascinating inner workings of this historic encryption method that revolutionized cryptography in the 19th century. Through this in-depth report, unravel the clever 5x5 grid system, innovative digraph substitution rules, and the cipher's remarkable resistance to frequency analysis attacks that stumped codebreakers of its time. Discover the strategic genius behind the Playfair cipher's design and its lasting impact on the evolution of modern cryptography.""",
            style: TextStyle(fontSize: 21, height: 1.3),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  decoration: _boxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'open the report',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    boxShadow: _boxShadow,
  );
}

List<BoxShadow> get _boxShadow {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(.3),
      offset: Offset(0, 2),
      blurRadius: 12,
      blurStyle: BlurStyle.outer,
      spreadRadius: 5,
    ),
  ];
}
