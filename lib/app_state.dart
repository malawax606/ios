import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _HomePage = prefs.getBool('ff_HomePage') ?? _HomePage;
    });
    _safeInit(() {
      _ChatPage = prefs.getBool('ff_ChatPage') ?? _ChatPage;
    });
    _safeInit(() {
      _ProfilePage = prefs.getBool('ff_ProfilePage') ?? _ProfilePage;
    });
    _safeInit(() {
      _Somali = prefs.getBool('ff_Somali') ?? _Somali;
    });
    _safeInit(() {
      _English = prefs.getString('ff_English') ?? _English;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_User')) {
        try {
          final serializedData = prefs.getString('ff_User') ?? '{}';
          _User = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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

  bool _HomePage = true;
  bool get HomePage => _HomePage;
  set HomePage(bool value) {
    _HomePage = value;
    prefs.setBool('ff_HomePage', value);
  }

  bool _ChatPage = false;
  bool get ChatPage => _ChatPage;
  set ChatPage(bool value) {
    _ChatPage = value;
    prefs.setBool('ff_ChatPage', value);
  }

  bool _ProfilePage = false;
  bool get ProfilePage => _ProfilePage;
  set ProfilePage(bool value) {
    _ProfilePage = value;
    prefs.setBool('ff_ProfilePage', value);
  }

  bool _Somali = false;
  bool get Somali => _Somali;
  set Somali(bool value) {
    _Somali = value;
    prefs.setBool('ff_Somali', value);
  }

  String _English = '';
  String get English => _English;
  set English(String value) {
    _English = value;
    prefs.setString('ff_English', value);
  }

  UserStruct _User = UserStruct();
  UserStruct get User => _User;
  set User(UserStruct value) {
    _User = value;
    prefs.setString('ff_User', value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_User);
    prefs.setString('ff_User', _User.serialize());
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
