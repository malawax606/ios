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

import 'package:device_marketing_names/device_marketing_names.dart';

Future<String> getCurrentDeviceMarketingName() async {
  try {
    // Instantiate the DeviceMarketingNames class
    final deviceNames = DeviceMarketingNames();

    // Get one marketing name of the current device
    String deviceName = await deviceNames.getSingleName();

    // Optionally, you can also get all names separated by " / "
    // String deviceName = await deviceNames.getNames();

    return deviceName;
  } catch (e) {
    return "Unknown Device";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
