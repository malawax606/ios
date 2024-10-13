import '../database.dart';

class UpdateTable extends SupabaseTable<UpdateRow> {
  @override
  String get tableName => 'Update';

  @override
  UpdateRow createRow(Map<String, dynamic> data) => UpdateRow(data);
}

class UpdateRow extends SupabaseDataRow {
  UpdateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UpdateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get version => getField<String>('Version');
  set version(String? value) => setField<String>('Version', value);
}
