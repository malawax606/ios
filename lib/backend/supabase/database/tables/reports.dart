import '../database.dart';

class ReportsTable extends SupabaseTable<ReportsRow> {
  @override
  String get tableName => 'Reports';

  @override
  ReportsRow createRow(Map<String, dynamic> data) => ReportsRow(data);
}

class ReportsRow extends SupabaseDataRow {
  ReportsRow(super.data);

  @override
  SupabaseTable get table => ReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get reportSender => getField<String>('Report Sender');
  set reportSender(String? value) => setField<String>('Report Sender', value);

  String? get reportedUser => getField<String>('Reported User');
  set reportedUser(String? value) => setField<String>('Reported User', value);

  String? get reson => getField<String>('Reson');
  set reson(String? value) => setField<String>('Reson', value);

  String? get image => getField<String>('Image');
  set image(String? value) => setField<String>('Image', value);

  bool get viewed => getField<bool>('Viewed')!;
  set viewed(bool value) => setField<bool>('Viewed', value);
}
