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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future localNotification(
  String? title,
  String? content,
) async {
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the Android initialization settings
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Configure the iOS/macOS initialization settings (renamed to DarwinInitializationSettings)
  var initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {
      // Handle the local notification when received while app is in the foreground
    },
  );

  // Configure the initialization settings for FlutterLocalNotificationsPlugin
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS:
        initializationSettingsIOS, // Use DarwinInitializationSettings for iOS/macOS
  );

  // Initialize the FlutterLocalNotificationsPlugin with the initialization settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configure the Android notification details
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Configure the iOS notification details (renamed to DarwinNotificationDetails)
  var iosPlatformChannelSpecifics = DarwinNotificationDetails(
    sound: 'default', // Optional: Specify a sound if needed
  );

  // Configure the notification details
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS:
        iosPlatformChannelSpecifics, // Use DarwinNotificationDetails for iOS/macOS
  );

  // Show the notification
  await flutterLocalNotificationsPlugin.show(
    0,
    title ?? '', // Use title parameter here
    content ?? '', // Use content parameter here
    notificationDetails,
    payload: 'item x',
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
