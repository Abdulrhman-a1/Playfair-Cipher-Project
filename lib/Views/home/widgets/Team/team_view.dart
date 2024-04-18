import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Team/widgets/card.dart';

class TeamView extends StatefulWidget {
  const TeamView({super.key});

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          children: [
            MemberCard(
              name: "Abdulrhman Albusaad",
              workDescription: "Web page",
              image: 'assets/team/img1.png',
              imageBackground: Colors.indigo[100]!,
              badgeText: "Developer",
              badgeColor: Colors.indigo[300]!,
            ),
            MemberCard(
              name: "",
              workDescription: "",
              image: 'assets/team/img2.png',
              imageBackground: Colors.lightGreen[200]!,
              badgeText: "Developer",
              badgeColor: Colors.lightGreenAccent[100]!,
            ),
            MemberCard(
              name: "",
              workDescription: "",
              image: 'assets/team/img3.png',
              imageBackground: Colors.deepOrangeAccent[200]!,
              badgeText: "Developer",
              badgeColor: Colors.deepOrangeAccent[100]!,
            ),
            MemberCard(
              name: "",
              workDescription: "",
              image: 'assets/team/img4.png',
              imageBackground: Colors.deepPurpleAccent[100]!,
              badgeText: "Designer",
              badgeColor: Colors.deepPurpleAccent[100]!,
            ),
          ],
        ),
      ),
    );
  }
}
