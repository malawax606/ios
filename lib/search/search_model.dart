import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    uSernameFocusNode?.dispose();
    uSernameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();
  }
}
