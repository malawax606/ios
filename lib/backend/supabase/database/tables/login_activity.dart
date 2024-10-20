import '../database.dart';

class LoginActivityTable extends SupabaseTable<LoginActivityRow> {
  @override
  String get tableName => 'Login Activity';

  @override
  LoginActivityRow createRow(Map<String, dynamic> data) =>
      LoginActivityRow(data);
}

class LoginActivityRow extends SupabaseDataRow {
  LoginActivityRow(super.data);

  @override
  SupabaseTable get table => LoginActivityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get deviceName => getField<String>('Device Name');
  set deviceName(String? value) => setField<String>('Device Name', value);

  String? get country => getField<String>('Country');
  set country(String? value) => setField<String>('Country', value);

  String? get city => getField<String>('City');
  set city(String? value) => setField<String>('City', value);

  String get userID => getField<String>('UserID')!;
  set userID(String value) => setField<String>('UserID', value);
}
