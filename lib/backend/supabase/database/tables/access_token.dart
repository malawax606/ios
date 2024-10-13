import '../database.dart';

class AccessTokenTable extends SupabaseTable<AccessTokenRow> {
  @override
  String get tableName => 'Access Token';

  @override
  AccessTokenRow createRow(Map<String, dynamic> data) => AccessTokenRow(data);
}

class AccessTokenRow extends SupabaseDataRow {
  AccessTokenRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AccessTokenTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get token => getField<String>('Token');
  set token(String? value) => setField<String>('Token', value);
}
