import 'dart:math';
import "package:flutter/material.dart";
import 'package:zoom_clone/resources/jitisi_meet.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitisiMeetMethods _jitisiMeetMethods = JitisiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitisiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, "/videocallScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onTappedPressed: createNewMeeting,
            text: "New Meeting",
            iconName: Icons.videocam,
          ),
          HomeMeetingButton(
            onTappedPressed: () => joinMeeting(context),
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
    ]);
  }
}
