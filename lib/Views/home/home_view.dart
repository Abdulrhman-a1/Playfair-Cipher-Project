import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Centered_view/Centered_view.dart';
import 'package:plaincipher/Views/home/widgets/CourseDetails/home.dart';
import 'package:plaincipher/Views/home/widgets/EnterPage/enter_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: ((scrollOffset) {
              return CenteredView(
                child: Column(
                  children: [
                    CourseDetails(),
                  ],
                ),
              );
            }),
          ),
          ScrollTransformItem(
            builder: ((scrollOffset) {
              return CenteredView(
                child: Column(
                  children: [
                    EnterPage(),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
