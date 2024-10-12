import '../database.dart';

class AppVersionTable extends SupabaseTable<AppVersionRow> {
  @override
  String get tableName => 'App_Version';

  @override
  AppVersionRow createRow(Map<String, dynamic> data) => AppVersionRow(data);
}

class AppVersionRow extends SupabaseDataRow {
  AppVersionRow(super.data);

  @override
  SupabaseTable get table => AppVersionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get version => getField<String>('Version');
  set version(String? value) => setField<String>('Version', value);

  String? get updateText => getField<String>('Update_Text');
  set updateText(String? value) => setField<String>('Update_Text', value);

  DateTime? get time => getField<DateTime>('time');
  set time(DateTime? value) => setField<DateTime>('time', value);

  String? get idd => getField<String>('idd');
  set idd(String? value) => setField<String>('idd', value);

  String? get updateUrl => getField<String>('UpdateUrl');
  set updateUrl(String? value) => setField<String>('UpdateUrl', value);
}
