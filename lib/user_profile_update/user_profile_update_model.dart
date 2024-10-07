import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'user_profile_update_widget.dart' show UserProfileUpdateWidget;
import 'package:flutter/material.dart';

class UserProfileUpdateModel extends FlutterFlowModel<UserProfileUpdateWidget> {
  ///  Local state fields for this page.

  String? chat1;

  String? chat2;

  List<String> ussers = [];
  void addToUssers(String item) => ussers.add(item);
  void removeFromUssers(String item) => ussers.remove(item);
  void removeAtIndexFromUssers(int index) => ussers.removeAt(index);
  void insertAtIndexInUssers(int index, String item) =>
      ussers.insert(index, item);
  void updateUssersAtIndex(int index, Function(String) updateFn) =>
      ussers[index] = updateFn(ussers[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Completer<List<UserRow>>? requestCompleter;

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
