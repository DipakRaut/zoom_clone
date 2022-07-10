import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onTappedPressed: () {},
              text: "New Meeting",
              iconName: Icons.videocam,
            ),
            HomeMeetingButton(
              onTappedPressed: () {},
              text: "join Meeting",
              iconName: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onTappedPressed: () {},
              text: "Schedule ",
              iconName: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onTappedPressed: () {},
              text: "Share Screen",
              iconName: Icons.arrow_upward,
            )
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create/Join Metting with just click!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ))
      ]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          // unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meetings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ]),
    );
  }
}
