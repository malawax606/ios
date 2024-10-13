import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/from.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'form_widget.dart' show FormWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormModel extends FlutterFlowModel<FormWidget> {
  ///  Local state fields for this page.

  String? url;

  String? looking;

  String? countryy = 'Somalia';

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? fromController;
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (country)] action in Form widget.
  ApiCallResponse? country;
  // Stores action output result for [Backend Call - API (Country Falg)] action in Form widget.
  ApiCallResponse? flg;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  String? _usernameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'szbcvyur' /* Username is required. */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7am0d75q' /* Name is required. */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for Job widget.
  String? jobValue;
  FormFieldController<String>? jobValueController;
  // State field(s) for Skincolor widget.
  String? skincolorValue;
  FormFieldController<String>? skincolorValueController;
  // State field(s) for married widget.
  String? marriedValue;
  FormFieldController<String>? marriedValueController;
  // State field(s) for Aboutme widget.
  FocusNode? aboutmeFocusNode;
  TextEditingController? aboutmeTextController;
  String? Function(BuildContext, String?)? aboutmeTextControllerValidator;
  String? _aboutmeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7yvuyji9' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - getFCM] action in Button_ios widget.
  String? fcm;
  // Stores action output result for [Custom Action - getAccessToken] action in Button_ios widget.
  String? token;

  @override
  void initState(BuildContext context) {
    usernameTextControllerValidator = _usernameTextControllerValidator;
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    aboutmeTextControllerValidator = _aboutmeTextControllerValidator;
  }

  @override
  void dispose() {
    fromController?.finish();
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    aboutmeFocusNode?.dispose();
    aboutmeTextController?.dispose();
  }
}
