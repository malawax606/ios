import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_audio_copy_model.dart';
export 'live_audio_copy_model.dart';

class LiveAudioCopyWidget extends StatefulWidget {
  const LiveAudioCopyWidget({
    super.key,
    required this.id,
    required this.host,
    required this.url,
  });

  final int? id;
  final bool? host;
  final String? url;

  @override
  State<LiveAudioCopyWidget> createState() => _LiveAudioCopyWidgetState();
}

class _LiveAudioCopyWidgetState extends State<LiveAudioCopyWidget> {
  late LiveAudioCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveAudioCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.LivePage(
              width: double.infinity,
              height: double.infinity,
              roomID: '2345',
              isHost: false,
              userID: currentUserUid,
              appID: 593542377,
              appSign:
                  '11d5ec816463541a48ba7aac238ccfcc022d2728d3f5e5e8da423857d4686a3b',
              userName: 'user',
              userAvatarUrl: widget!.url!,
            ),
          ),
        ),
      ),
    );
  }
}
