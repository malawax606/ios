import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Username = prefs.getString('ff_Username') ?? _Username;
    });
    _safeInit(() {
      _UserId = prefs.getString('ff_UserId') ?? _UserId;
    });
    _safeInit(() {
      _Looking = prefs.getString('ff_Looking') ?? _Looking;
    });
    _safeInit(() {
      _Done = prefs.getBool('ff_Done') ?? _Done;
    });
    _safeInit(() {
      _Profile = prefs.getString('ff_Profile') ?? _Profile;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _mes = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World Hello World Hello World Hello World Hello World Hello World Hello World',
    'Hello World',
    'Hello World',
    'Hello World Hello World Hello World Hello World Hello World Hello World Hello World',
    'Hello World'
  ];
  List<String> get mes => _mes;
  set mes(List<String> value) {
    _mes = value;
  }

  void addToMes(String value) {
    mes.add(value);
  }

  void removeFromMes(String value) {
    mes.remove(value);
  }

  void removeAtIndexFromMes(int index) {
    mes.removeAt(index);
  }

  void updateMesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    mes[index] = updateFn(_mes[index]);
  }

  void insertAtIndexInMes(int index, String value) {
    mes.insert(index, value);
  }

  String _Username = 'Ahmed';
  String get Username => _Username;
  set Username(String value) {
    _Username = value;
    prefs.setString('ff_Username', value);
  }

  String _UserId = '';
  String get UserId => _UserId;
  set UserId(String value) {
    _UserId = value;
    prefs.setString('ff_UserId', value);
  }

  String _Looking = '';
  String get Looking => _Looking;
  set Looking(String value) {
    _Looking = value;
    prefs.setString('ff_Looking', value);
  }

  bool _Done = false;
  bool get Done => _Done;
  set Done(bool value) {
    _Done = value;
    prefs.setBool('ff_Done', value);
  }

  String _Profile = '';
  String get Profile => _Profile;
  set Profile(String value) {
    _Profile = value;
    prefs.setString('ff_Profile', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
