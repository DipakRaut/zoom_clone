import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/historyMeetingScreen.dart';
import 'package:zoom_clone/screens/meetingScreen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/customButton.dart';
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

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text("Contacts"),
    CustomButton(buttonName: "Logout", onPressed: () => AuthMethods().signOut())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: pages[_page],
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
