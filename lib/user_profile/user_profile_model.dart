import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/messages_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
