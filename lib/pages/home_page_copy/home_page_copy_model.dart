import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appVersion] action in HomePageCopy widget.
  String? version;
  // Stores action output result for [Backend Call - API (Supabase App Vesrion)] action in HomePageCopy widget.
  ApiCallResponse? versionApi;
  // Stores action output result for [Backend Call - API (Supabase User)] action in HomePageCopy widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Image Upload)] action in HomePageCopy widget.
  ApiCallResponse? url;
  Completer<List<UserRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - API (country)] action in HomePageCopy widget.
  ApiCallResponse? country;
  // Stores action output result for [Backend Call - API (Country Falg)] action in HomePageCopy widget.
  ApiCallResponse? flg;
  // Stores action output result for [Custom Action - getFCM] action in HomePageCopy widget.
  String? fcm;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  // Stores action output result for [Custom Action - getAccessToken] action in Column widget.
  String? token;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
      final requestComplete = requestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
