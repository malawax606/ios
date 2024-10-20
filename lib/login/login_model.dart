import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (country)] action in Button widget.
  ApiCallResponse? country;
  // Stores action output result for [Custom Action - getCurrentDeviceMarketingName] action in Button widget.
  String? deviceName;
  // Stores action output result for [Custom Action - getAccessToken] action in Button widget.
  String? tokens;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
