import '/auth/firebase_auth/auth_util.dart';
import '/components/email_verify_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'email_change_widget.dart' show EmailChangeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailChangeModel extends FlutterFlowModel<EmailChangeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for New-Email widget.
  FocusNode? newEmailFocusNode;
  TextEditingController? newEmailTextController;
  String? Function(BuildContext, String?)? newEmailTextControllerValidator;
  // State field(s) for confirm-Email widget.
  FocusNode? confirmEmailFocusNode;
  TextEditingController? confirmEmailTextController;
  String? Function(BuildContext, String?)? confirmEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    newEmailFocusNode?.dispose();
    newEmailTextController?.dispose();

    confirmEmailFocusNode?.dispose();
    confirmEmailTextController?.dispose();
  }
}
