import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blocked_widget.dart' show BlockedWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BlockedModel extends FlutterFlowModel<BlockedWidget> {
  ///  Local state fields for this page.

  List<String> blocked = [];
  void addToBlocked(String item) => blocked.add(item);
  void removeFromBlocked(String item) => blocked.remove(item);
  void removeAtIndexFromBlocked(int index) => blocked.removeAt(index);
  void insertAtIndexInBlocked(int index, String item) =>
      blocked.insert(index, item);
  void updateBlockedAtIndex(int index, Function(String) updateFn) =>
      blocked[index] = updateFn(blocked[index]);

  ///  State fields for stateful widgets in this page.

  Completer<List<UserRow>>? requestCompleter2;
  Completer<List<UserRow>>? requestCompleter1;

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
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
