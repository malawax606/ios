import '../database.dart';

class OnlineTable extends SupabaseTable<OnlineRow> {
  @override
  String get tableName => 'online';

  @override
  OnlineRow createRow(Map<String, dynamic> data) => OnlineRow(data);
}

class OnlineRow extends SupabaseDataRow {
  OnlineRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OnlineTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get online => getField<DateTime>('online')!;
  set online(DateTime value) => setField<DateTime>('online', value);

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);
}
