import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCZZuFhZQuXPmyef3doOxfcbwau7UYJIHY",
            authDomain: "deating332.firebaseapp.com",
            projectId: "deating332",
            storageBucket: "deating332.appspot.com",
            messagingSenderId: "565995859325",
            appId: "1:565995859325:web:31f77ff309aeeb53007014",
            measurementId: "G-RZZLEDZ6M8"));
  } else {
    await Firebase.initializeApp();
  }
}
