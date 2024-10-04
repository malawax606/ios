import '../database.dart';

class UserNoProfileTable extends SupabaseTable<UserNoProfileRow> {
  @override
  String get tableName => 'User-NoProfile';

  @override
  UserNoProfileRow createRow(Map<String, dynamic> data) =>
      UserNoProfileRow(data);
}

class UserNoProfileRow extends SupabaseDataRow {
  UserNoProfileRow(super.data);

  @override
  SupabaseTable get table => UserNoProfileTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userID => getField<String>('UserID');
  set userID(String? value) => setField<String>('UserID', value);

  String? get profile => getField<String>('Profile');
  set profile(String? value) => setField<String>('Profile', value);

  String? get username => getField<String>('Username');
  set username(String? value) => setField<String>('Username', value);

  String? get country => getField<String>('Country');
  set country(String? value) => setField<String>('Country', value);
}
