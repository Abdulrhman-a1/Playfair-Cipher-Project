import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Call_action/Call_To_Action.dart';
import 'package:plaincipher/Views/home/widgets/Centered_view/Centered_view.dart';
import 'package:plaincipher/Views/home/widgets/CourseDetails/Course_details.dart';

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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: CenteredView(
          child: Column(
            children: [
              CourseDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
