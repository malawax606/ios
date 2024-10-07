import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_page2_widget.dart' show HomePage2Widget;
import 'package:flutter/material.dart';

class HomePage2Model extends FlutterFlowModel<HomePage2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Supabase User)] action in HomePage2 widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Image Upload)] action in HomePage2 widget.
  ApiCallResponse? url;
  Completer<List<UserRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - API (country)] action in HomePage2 widget.
  ApiCallResponse? country;
  // Stores action output result for [Backend Call - API (Country Falg)] action in HomePage2 widget.
  ApiCallResponse? flg;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  Completer<List<UserRow>>? requestCompleter1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
