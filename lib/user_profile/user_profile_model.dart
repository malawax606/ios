import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

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
