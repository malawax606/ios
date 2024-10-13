import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_test_widget.dart' show HomeTestWidget;
import 'package:flutter/material.dart';

class HomeTestModel extends FlutterFlowModel<HomeTestWidget> {
  ///  Local state fields for this page.

  String tokens = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getAccessToken] action in Text widget.
  String? getToken;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Stores action output result for [Custom Action - getAccessToken] action in Column widget.
  String? token;

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
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
