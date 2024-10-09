import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  int? id;

  String? username;

  String? age;

  ///  State fields for stateful widgets in this page.

  // State field(s) for USername widget.
  FocusNode? uSernameFocusNode;
  TextEditingController? uSernameTextController;
  String? Function(BuildContext, String?)? uSernameTextControllerValidator;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  Completer<List<UserRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    uSernameFocusNode?.dispose();
    uSernameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();
  }

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
