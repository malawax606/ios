// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supaRealtime(
  String? tableName,
  Future<dynamic> Function() reloadAction,
) async {
  final supabase = SupaFlow.client;
  String table = tableName ?? '*';
  final channel = supabase.channel('public:' + table);
  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      reloadAction();
      print('Reloaded.');
    },
  ).subscribe();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
