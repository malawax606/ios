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

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<String> getDeviceName() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceModel;

  // For Android devices
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceModel = androidInfo.model;
  }
  // For iOS devices
  else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceModel =
        iosInfo.utsname.machine ?? 'Unknown Device'; // Use null-ish operator
  } else {
    deviceModel = 'Unknown Device';
  }

  return deviceModel;
}

// Map Android model codes to full marketing names
String mapAndroidModelToDeviceName(String manufacturer, String model) {
  if (manufacturer == 'Samsung') {
    switch (model) {
      case 'SM-G998B':
        return 'Samsung Galaxy S21 Ultra';
      case 'SM-G996B':
        return 'Samsung Galaxy S21+';
      case 'SM-G991B':
        return 'Samsung Galaxy S21';
      case 'SM-G973F':
        return 'Samsung Galaxy S10';
      case 'SM-G975F':
        return 'Samsung Galaxy S10+';
      case 'SM-A505F':
        return 'Samsung Galaxy A50';
      case 'SM-A715F':
        return 'Samsung Galaxy A71';
      // Add more Samsung models here
      default:
        return 'Unknown Samsung Device';
    }
  } else if (manufacturer == 'Google') {
    switch (model) {
      case 'Pixel 5':
        return 'Google Pixel 5';
      case 'Pixel 4a':
        return 'Google Pixel 4a';
      case 'Pixel 6':
        return 'Google Pixel 6';
      case 'Pixel 6 Pro':
        return 'Google Pixel 6 Pro';
      // Add more Google Pixel models here
      default:
        return 'Unknown Google Device';
    }
  } else if (manufacturer == 'OnePlus') {
    switch (model) {
      case 'ONEPLUS A6013':
        return 'OnePlus 6T';
      case 'ONEPLUS A5010':
        return 'OnePlus 5T';
      case 'ONEPLUS A6003':
        return 'OnePlus 6';
      // Add more OnePlus models here
      default:
        return 'Unknown OnePlus Device';
    }
  }
  // Add more manufacturers here (Xiaomi, Huawei, etc.)
  return '$manufacturer $model'; // Default if no match found
}

// Map iOS model identifiers to full marketing names
String mapIosModelToDeviceName(String model) {
  switch (model) {
    case 'iPhone14,3':
      return 'iPhone 13 Pro Max';
    case 'iPhone14,2':
      return 'iPhone 13 Pro';
    case 'iPhone14,5':
      return 'iPhone 13';
    case 'iPhone14,4':
      return 'iPhone 13 mini';
    case 'iPhone13,4':
      return 'iPhone 12 Pro Max';
    case 'iPhone13,3':
      return 'iPhone 12 Pro';
    case 'iPhone13,2':
      return 'iPhone 12';
    case 'iPhone13,1':
      return 'iPhone 12 mini';
    case 'iPhone12,5':
      return 'iPhone 11 Pro Max';
    case 'iPhone12,3':
      return 'iPhone 11 Pro';
    case 'iPhone12,1':
      return 'iPhone 11';
    case 'iPhone11,8':
      return 'iPhone XR';
    case 'iPhone11,6':
      return 'iPhone XS Max';
    case 'iPhone11,2':
      return 'iPhone XS';
    case 'iPhone10,6':
      return 'iPhone X';
    // Add more iPhone models here
    default:
      return 'Unknown iPhone';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
