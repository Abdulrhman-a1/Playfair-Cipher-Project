import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/homedetils/home.dart';
import 'package:plaincipher/Views/home/widgets/EnterPage/enter_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CourseDetails(),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/12.png',
                color: Colors.transparent,
                fit: BoxFit.contain,
                width: 350,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward, size: 40),
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.viewportDimension,
                duration: Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
          ),
          EnterPage(),
          IconButton(
            icon: Icon(Icons.arrow_upward, size: 40),
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
