import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Call_action/Call_To_Action.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Playfair Cipher',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 75, height: 1.2),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Is a polygraphic substitution cipher that employs a 5x5 grid of letters for encryption, making it more resistant to frequency analysis compared to traditional ciphers. Its strength lies in its use of digraphs, where pairs of letters are encrypted based on their positions within the grid.',
                  style: TextStyle(fontSize: 21, height: 1.7),
                ),
              ],
            ),
          ),
          ScrollDownArrow(controller: _scrollController)
        ],
      ),
    );
  }
}
