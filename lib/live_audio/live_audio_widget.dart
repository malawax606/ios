import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'live_audio_model.dart';
export 'live_audio_model.dart';

class LiveAudioWidget extends StatefulWidget {
  const LiveAudioWidget({
    super.key,
    required this.id,
    required this.host,
    required this.url,
    required this.appId,
    required this.appSign,
  });

  final String? id;
  final bool? host;
  final String? url;
  final int? appId;
  final String? appSign;

  @override
  State<LiveAudioWidget> createState() => _LiveAudioWidgetState();
}

class _LiveAudioWidgetState extends State<LiveAudioWidget> {
  late LiveAudioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveAudioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.LivePage(
                width: double.infinity,
                height: double.infinity,
                roomID: '2345',
                isHost: true,
                userID: currentUserUid,
                appID: widget.appId!,
                appSign: widget.appSign!,
                userName: widget.id!,
                userAvatarUrl: widget.url!,
                backgroundImage: 'https://picsum.photos/seed/585/600',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
