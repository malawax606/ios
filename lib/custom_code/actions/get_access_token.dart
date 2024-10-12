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
  "type": "service_account",
  "project_id": "deating332",
  "private_key_id": "10e59f1cea4402857dbc1299c932fdc334c2051a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDD1gyWqTpGuqZH\ngTBPPPDnDS8reeBOEm5UgllvGoWTbta7ZUV+JPhaawC71yB+sgP9bujmz3CgAEuj\n/EUuCJ0IU/ZWntUmm8MDs/YlzIwjHnAoyYDgzhW6xik7YaQ9ETFNM2eix9Q6bYqg\nKXfbWckpPxtg8MjxJVW3mzFLcjfsvf/ciHRGxbYUQPf8mtNsJB/AP+rtCueFyTH0\nsz3uchF42HK1yr7trE2BMUwF6wG9PcdRVNHYO3Q820RPOb8/yZlydBTs78OksQBy\npgGA331c/4UbX0lSSsNKlRw7Pghlaxehod8H3a03Bdu2mFMZ5WkhwrVPP17gKx1C\nA4CyL/C5AgMBAAECggEAAJMxj29Y7Ym762momxGeUcittYaNVHVZ5RN1O0NcQTSk\nr+v/clFzTY1TCnolIodtGxKhtOxxfnVvGMC+HEE9YspKUXKfGhaq0dPhWmGOx3Ce\nBYSimqZdlSI3+fBoCMoy4fDkx5XSHJzN43lTsdgXjtsxqPfJWJSSkJra9XIqUgkz\nHq8/WRrqygd0xcn7NhFdn/pm/BN6/cRrJBRuxotHkgFvcfY32EXKvsd5cDFrTLOS\ngmBes6mZCRnRSxTDaOAJTZcqEcIv1nOs0wysDaduf6S18w1fCNYDQOyYTCaVTxfV\npzi8SDO8/eZGUWOotDklb/cka/Jr9LO4AjxhjySdzQKBgQD0G58sZmHhdGpfnj/r\n2nzKHeN0SHw7/p2zduuspH45nH7//ZTRGWawQ3fug924CcmgAuceLtOXu2At+WJm\ncKmj39WJxQ2gK7w+C9jpvnLXBKOy5i+2Z8gqk2FocM8byOD1jlYF9tWK5RI+7NpJ\nBzzMfOrb0KGQyiZV+zFaUMfxXQKBgQDNYGigqH2xcGRUaVN52khIpfvVd0H4CB8W\nfzvXY9KmzyX1dj9HF5wuKkBWha26L1sJxaoFqawdp7Rv8VE0s+wq1/TrtzsKHs0k\nxwqZmTNZMLiba6PfXN2c5tsni54ZDsRYU7/QR6n4AYxvchMQU9P4aDOwk1X6toxs\n3dy7zUV7DQKBgQDZQZwxEA4dclcaMuYBK7vUxzUg0UKAwuPoTfcC+IO/EqGVhENm\ntozGY8Xh6kry+QMR/oNkQZjgekvnnwUM10ikKRsMOu0dmM85CaJMpsvewqpPFr9w\nQH3OJs2S/pPVzrso0T2OoVj8/VN33aWJSX+7H5KHgO/KxZ/I9n++Ohc5oQKBgAEq\nbu2ahzwemzMvdd3XM1nWN1u61ZEG2sZR6pEKbAOuYVTHWwyYQbaxXrQfBiFsa2Pe\nz1xA3k08ynVoNUHLU6famfVMkPU5v4hZ6OF+USBMen/HWKLH8CoX1V6gGEGkJ9Eo\niIoyHfDecWGgkCMjlqxuSvzRmUdXCe0ERWB7hc1xAoGAQV2JNqUP3/giuqYV4Ned\nzr0wPMkwA81AoURjm8F4ERHwaDkkWTr5cP6xmdHn9QXScIqKxbe6Q7rDZvN6GZW0\nIFS1aLfeT9/Q2h1D2MLUZUwO9JC+diGupb32MEDA6LTJkNDuetNK18rO51F+bFBk\nOtAW78hsoqUWtTY8O3owWZQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-kbndz@deating332.iam.gserviceaccount.com",
  "client_id": "117361325033236715834",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-kbndz%40deating332.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}


  ''');

  final scopes = ['https://www.googleapis.com/auth/cloud-platform'];
  var authClient = await clientViaServiceAccount(accountCredentials, scopes);
  var token = await authClient.credentials.accessToken.data;
  return token;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
