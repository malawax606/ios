import '/flutter_flow/flutter_flow_util.dart';
import 'report_widget.dart' show ReportWidget;
import 'package:flutter/material.dart';

class ReportModel extends FlutterFlowModel<ReportWidget> {
  ///  Local state fields for this component.

  bool sawir = false;

  bool magac = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for report_Text widget.
  FocusNode? reportTextFocusNode;
  TextEditingController? reportTextTextController;
  String? Function(BuildContext, String?)? reportTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reportTextFocusNode?.dispose();
    reportTextTextController?.dispose();
  }
}
