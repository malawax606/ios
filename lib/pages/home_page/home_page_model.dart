import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Supabase User)] action in HomePage widget.
  ApiCallResponse? user;
  // Stores action output result for [Custom Action - appVersion] action in HomePage widget.
  String? version;
  // Stores action output result for [Backend Call - API (Supabase App Vesrion)] action in HomePage widget.
  ApiCallResponse? versionApi;
  // Stores action output result for [Backend Call - API (Image Upload)] action in HomePage widget.
  ApiCallResponse? url;
  Completer<List<UserRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - API (country)] action in HomePage widget.
  ApiCallResponse? country;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - connectVpn] action in HomePage widget.
  bool? vpn;
  // Stores action output result for [Custom Action - connectNet] action in HomePage widget.
  bool? net;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Custom Action - getAccessToken] action in Tab widget.
  String? token1;
  Completer<List<UserRow>>? requestCompleter1;
  // Stores action output result for [Custom Action - getAccessToken] action in Column widget.
  String? token;
  // Stores action output result for [Custom Action - getAccessToken] action in Tab widget.
  String? token2;
  // Stores action output result for [Custom Action - getAccessToken] action in Column widget.
  String? token4;
  // Stores action output result for [Custom Action - getAccessToken] action in Tab widget.
  String? token3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    tabBarController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
