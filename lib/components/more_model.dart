import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'more_widget.dart' show MoreWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreModel extends FlutterFlowModel<MoreWidget> {
  ///  Local state fields for this component.

  List<String> myReport = [];
  void addToMyReport(String item) => myReport.add(item);
  void removeFromMyReport(String item) => myReport.remove(item);
  void removeAtIndexFromMyReport(int index) => myReport.removeAt(index);
  void insertAtIndexInMyReport(int index, String item) =>
      myReport.insert(index, item);
  void updateMyReportAtIndex(int index, Function(String) updateFn) =>
      myReport[index] = updateFn(myReport[index]);

  List<String> hisReport = [];
  void addToHisReport(String item) => hisReport.add(item);
  void removeFromHisReport(String item) => hisReport.remove(item);
  void removeAtIndexFromHisReport(int index) => hisReport.removeAt(index);
  void insertAtIndexInHisReport(int index, String item) =>
      hisReport.insert(index, item);
  void updateHisReportAtIndex(int index, Function(String) updateFn) =>
      hisReport[index] = updateFn(hisReport[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
