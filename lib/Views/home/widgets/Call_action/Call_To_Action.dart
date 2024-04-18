import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/EnterPage/enter_page.dart';

class ScrollDownArrow extends StatefulWidget {
  final ScrollController controller;

  const ScrollDownArrow({Key? key, required this.controller}) : super(key: key);

  @override
  _ScrollDownArrowState createState() => _ScrollDownArrowState();
}

class _ScrollDownArrowState extends State<ScrollDownArrow> {
  bool _isVisible = true;

  void _scrollDown() {
    widget.controller.animateTo(
      widget.controller.offset + MediaQuery.of(context).size.height,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => EnterPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.bottomCenter,
        child: IconButton(
          onPressed: _scrollDown,
          icon: Icon(Icons.arrow_downward),
          iconSize: 36,
          color: Colors.black,
        ),
      ),
    );
  }
}
