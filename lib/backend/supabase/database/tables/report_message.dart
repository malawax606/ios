import '../database.dart';

class ReportMessageTable extends SupabaseTable<ReportMessageRow> {
  @override
  String get tableName => 'Report Message';

  @override
  ReportMessageRow createRow(Map<String, dynamic> data) =>
      ReportMessageRow(data);
}

class ReportMessageRow extends SupabaseDataRow {
  ReportMessageRow(super.data);

  @override
  SupabaseTable get table => ReportMessageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get reporterUser => getField<String>('Reporter User');
  set reporterUser(String? value) => setField<String>('Reporter User', value);

  String? get reportedUser => getField<String>('Reported User');
  set reportedUser(String? value) => setField<String>('Reported User', value);

  String? get message => getField<String>('Message');
  set message(String? value) => setField<String>('Message', value);

  bool? get checked => getField<bool>('Checked');
  set checked(bool? value) => setField<bool>('Checked', value);
}
