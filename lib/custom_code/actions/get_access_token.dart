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
  "private_key_id": "2f3c948fc23372ecf1c242692992f45d489d04bb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDcsUmc7L/k4xgH\nfwt5/OjgxF/lO2kwMyivyd/9Ol1t2xR4bVUroGoazsFTkpLFmueW0Ezt9hl4ZN8c\nLMd+ajLmDH7BnLpY2D6uf0LpsovQ5Ka2mN7yjJwbidJ1Qkp5/cSuXe6fsimH419s\narF49kcnbPwJGawIfb6PctPGgy6pOXxhSt9KEcViTCsPF5dfEYEpUYsTnAHkyO+r\n81m1T/0LT1RpsONO1dTGxQOnrQ7nSxmQpccWNxSZvlT8rRA7T5yJ7Nb7Rsnzdi9S\nm72EAcg3Btbkva0dDbE+lh0K+pZIEzKp6jPRu+HK2Mq6FrP7SOPx7MVdvsbS3Y2C\nJJk20d89AgMBAAECggEAATyYGEJGYAK6xX37gzs81deb3vW6hOvgeD22HN3pHJ67\n6mHYdpZfSderQyvg2S0hS5nOuI2mvmM4UdjZZFa1gs8CndSiQbGyhjlN12/p8yl4\n2rCYHT1W+ZuH26LbtnvK0JxTpD70FyAZzop5hJ9CrlCgx+9GJMUJnpWq5KOjDQ00\nAH3oEC7LsRuShGc4r3mDLVcsZCqLTxiu07qOwERrJj1cMEzRc8CK3masYWYq4Jtj\nAdKbvtBBQCTD4rKbzPV2d02OFSaeZTglz8Zo79E734nhnL6E5d6ZDQlwfcZwwrcH\n9khFb0f0ITq3r9Ou7enXYZCIROCwrz2dsYlepjsCkQKBgQDvWIHYp/RpIdQXEk1x\nUX7Vm6xXrJmeCyQ3ZeeXZ4S6wOce2uOuzdLSIZ65QR4uBkKFMyhFr2OQBEfSu2qg\neJSmhq4BV8VF7VADYIF4p62U5K1+vBWPxAmwIwSxQjR04A0v5DWJyRmjQAQI8dDP\nx7HnBoYx1ZGMpWGqAOVeKdmh8QKBgQDsDII8EkR73Jp/AVQbddJYtENGVc1Ba9ww\nwSjgOc8mpV5Ta5g523XxbpMDEwzbHHL6VyLWrFvs3fKRRJMfuXwaP+BJYjBy4mTi\n+y81MUC5UXl6k5DWf4gns4likp/EPR/aeN13SQQ+w2aA7G/ivWvppC9zAauHQJ5D\n8W6Ag4kGDQKBgHoIr5PO9uBPvjrROykm+ztgdzvwphad6aZRUAazYkpyJqVlx6cO\nDIrVV39vQzsGOA6AKe114pbAh/pbUp9lO624h6npnYzs1doS75CcNfXvrsIqlffK\nZYIoKLFUZzicMD0V53JMVcUV07jXyrbWQ8/eVLe+A8spW6V5dXlQb0WRAoGAfPWq\nRC7PflqslyuW4OqgrkDPlH57qHR3HoBDKWCxHx5QLw04ivh5GZSV0vzUw3HuFETo\ntoiMKXrdnLWWxSamYicKjw6h40+iZN7ggOJQB0rwakmQVV0yMQJEaqCAX5yULk3p\nv+oxiyBaNUn1eS0Z4Zf/Xny112YH4qP/AZ2gfkkCgYAtPAQJlfIjv/6lD9hNWmm0\n2HQdJxiBvMG1iofyJeLAnk1kvpX3iMHSATjQhb3FlpHQ3U9cEDi6N6X0TQWBVR5G\n/D9PyLN2RYOc2HwIUM0/dHlupwGguBzgL67msddyn6I4wNiKqojmmgf0gR1MCkjC\n/tK7bmZ3r/lI6QS2EZYDGQ==\n-----END PRIVATE KEY-----\n",
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
