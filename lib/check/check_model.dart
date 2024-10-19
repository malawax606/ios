import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'check_widget.dart' show CheckWidget;
import 'package:flutter/material.dart';

class CheckModel extends FlutterFlowModel<CheckWidget> {
  ///  Local state fields for this page.

  UserRow? user;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - connectVpn] action in Check widget.
  bool? vpn;
  // Stores action output result for [Custom Action - appVersion] action in Check widget.
  String? versio;
  // Stores action output result for [Backend Call - API (Supabase App Vesrion)] action in Check widget.
  ApiCallResponse? versionSupa;
  // Stores action output result for [Custom Action - connectNet] action in Check widget.
  bool? net;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
