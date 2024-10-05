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
    required this.roomID,
    this.isHost = false,
  });

  final double? width;
  final double? height;

  final String roomID;
  final bool isHost;

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID:
            593542377, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            "11d5ec816463541a48ba7aac238ccfcc022d2728d3f5e5e8da423857d4686a3b", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: 'user_name',
        roomID: widget.roomID,
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
      ),
    );
  }
}
