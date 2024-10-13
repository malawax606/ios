import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'report_done_widget.dart' show ReportDoneWidget;
import 'package:flutter/material.dart';

class ReportDoneModel extends FlutterFlowModel<ReportDoneWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
