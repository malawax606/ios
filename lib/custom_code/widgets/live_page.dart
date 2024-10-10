// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LivePage extends StatefulWidget {
  const LivePage({
    super.key,
    this.width,
    this.height,
    required this.appID,
    required this.appSign,
    required this.userID,
    required this.userName,
    required this.userAvatarUrl,
    required this.backgroundImage,
    required this.roomID,
    required this.isHost,
  });

  final double? width;
  final double? height;
  final int appID;
  final String appSign;
  final String userID;
  final String userName;
  final String userAvatarUrl;
  final String backgroundImage;
  final String roomID;
  final bool isHost;

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: widget
            .appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: widget
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: widget.userID,
        userName: widget.userName,
        roomID: widget.roomID,
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()

          ///  The userAvatarUrl must be within 64 bytes. If exceeds, the default background is displayed.
          ..userAvatarUrl = widget.userAvatarUrl
          ..background = widget.backgroundImage,
      ),
    );
  }
}
