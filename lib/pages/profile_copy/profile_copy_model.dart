import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'profile_copy_widget.dart' show ProfileCopyWidget;
import 'package:flutter/material.dart';

class ProfileCopyModel extends FlutterFlowModel<ProfileCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appVersion] action in ProfileCopy widget.
  String? version;
  // Stores action output result for [Backend Call - API (Supabase App Vesrion)] action in ProfileCopy widget.
  ApiCallResponse? versionApi;
  // Stores action output result for [Backend Call - API (Supabase User)] action in ProfileCopy widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Image Upload)] action in ProfileCopy widget.
  ApiCallResponse? url;
  Completer<List<UserRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (country)] action in ProfileCopy widget.
  ApiCallResponse? country;
  // Stores action output result for [Backend Call - API (Country Falg)] action in ProfileCopy widget.
  ApiCallResponse? flg;
  // Stores action output result for [Custom Action - getFCM] action in ProfileCopy widget.
  String? fcm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
