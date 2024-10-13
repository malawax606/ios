import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'chat_page_copy_widget.dart' show ChatPageCopyWidget;
import 'package:flutter/material.dart';

class ChatPageCopyModel extends FlutterFlowModel<ChatPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appVersion] action in ChatPageCopy widget.
  String? version;
  // Stores action output result for [Backend Call - API (Supabase App Vesrion)] action in ChatPageCopy widget.
  ApiCallResponse? versionApi;
  // Stores action output result for [Backend Call - API (Supabase User)] action in ChatPageCopy widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Image Upload)] action in ChatPageCopy widget.
  ApiCallResponse? url;
  Completer<List<UserRow>>? requestCompleter3;
  // Stores action output result for [Backend Call - API (country)] action in ChatPageCopy widget.
  ApiCallResponse? country;
  // Stores action output result for [Backend Call - API (Country Falg)] action in ChatPageCopy widget.
  ApiCallResponse? flg;
  // Stores action output result for [Custom Action - getFCM] action in ChatPageCopy widget.
  String? fcm;
  // Stores action output result for [Custom Action - getAccessToken] action in Column widget.
  String? token4;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  Completer<List<UserRow>>? requestCompleter2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
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
}
