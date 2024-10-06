import '../database.dart';

class FriendsTable extends SupabaseTable<FriendsRow> {
  @override
  String get tableName => 'Friends';

  @override
  FriendsRow createRow(Map<String, dynamic> data) => FriendsRow(data);
}

class FriendsRow extends SupabaseDataRow {
  FriendsRow(super.data);

  @override
  SupabaseTable get table => FriendsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<String> get friends => getListField<String>('Friends');
  set friends(List<String>? value) => setListField<String>('Friends', value);
}
