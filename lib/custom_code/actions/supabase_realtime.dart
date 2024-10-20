// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> supabaseRealtime(
    String table, Future Function() callbackAction) async {
  await SupaFlow.client.channel('public:$table').unsubscribe();

  SupaFlow.client
      .channel('public:$table')
      .on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(event: "INSERT", schema: 'public', table: table),
        (payload, [ref]) => callbackAction(),
      )
      .on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(event: "DELETE", schema: 'public', table: table),
        (payload, [ref]) => callbackAction(),
      )
      .on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(event: "UPDATE", schema: 'public', table: table),
        (payload, [ref]) => callbackAction(),
      )
      .on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(event: "TRUNCATE", schema: 'public', table: table),
        (payload, [ref]) => callbackAction(),
      )
      .subscribe();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
