import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'messages_widget.dart' show MessagesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  Local state fields for this component.

  String? chatId;

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, String item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(String) updateFn) =>
      users[index] = updateFn(users[index]);

  List<String> myChats = [];
  void addToMyChats(String item) => myChats.add(item);
  void removeFromMyChats(String item) => myChats.remove(item);
  void removeAtIndexFromMyChats(int index) => myChats.removeAt(index);
  void insertAtIndexInMyChats(int index, String item) =>
      myChats.insert(index, item);
  void updateMyChatsAtIndex(int index, Function(String) updateFn) =>
      myChats[index] = updateFn(myChats[index]);

  List<String> hisChat = [];
  void addToHisChat(String item) => hisChat.add(item);
  void removeFromHisChat(String item) => hisChat.remove(item);
  void removeAtIndexFromHisChat(int index) => hisChat.removeAt(index);
  void insertAtIndexInHisChat(int index, String item) =>
      hisChat.insert(index, item);
  void updateHisChatAtIndex(int index, Function(String) updateFn) =>
      hisChat[index] = updateFn(hisChat[index]);

  int? myChatNum;

  int? hisChatNum;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Text widget.
  ChatRow? doneee;
  Completer<List<AccessTokenRow>>? requestCompleter;
  // Stores action output result for [Custom Action - getAccessToken] action in Text widget.
  String? accessToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
