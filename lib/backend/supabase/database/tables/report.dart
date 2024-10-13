import '../database.dart';

class ReportTable extends SupabaseTable<ReportRow> {
  @override
  String get tableName => 'Report';

  @override
  ReportRow createRow(Map<String, dynamic> data) => ReportRow(data);
}

class ReportRow extends SupabaseDataRow {
  ReportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('USER ID');
  set userId(String? value) => setField<String>('USER ID', value);

  String? get reportedID => getField<String>('Reported ID');
  set reportedID(String? value) => setField<String>('Reported ID', value);

  String? get reporterID => getField<String>('Reporter ID');
  set reporterID(String? value) => setField<String>('Reporter ID', value);

  String? get reasonReported => getField<String>('Reason Reported');
  set reasonReported(String? value) =>
      setField<String>('Reason Reported', value);

  String? get username => getField<String>('Username');
  set username(String? value) => setField<String>('Username', value);

  String? get fullName => getField<String>('Full Name');
  set fullName(String? value) => setField<String>('Full Name', value);

  String? get profile => getField<String>('Profile');
  set profile(String? value) => setField<String>('Profile', value);

  bool? get checked => getField<bool>('Checked');
  set checked(bool? value) => setField<bool>('Checked', value);
}
