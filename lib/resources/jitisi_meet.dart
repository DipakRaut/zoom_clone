import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestoreMethods.dart';

class JitisiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String userName = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (userName.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethods.addToMeetingHistory(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}