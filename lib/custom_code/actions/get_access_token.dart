// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart'; // Add this for Google authentication

Future<String> getAccessToken() async {
  final accountCredentials = ServiceAccountCredentials.fromJson(r'''
  {
  
}


  ''');

  final scopes = ['https://www.googleapis.com/auth/cloud-platform'];
  var authClient = await clientViaServiceAccount(accountCredentials, scopes);
  var token = await authClient.credentials.accessToken.data;
  return token;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
