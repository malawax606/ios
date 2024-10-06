import '../database.dart';

class VideoCallTable extends SupabaseTable<VideoCallRow> {
  @override
  String get tableName => 'Video_Call';

  @override
  VideoCallRow createRow(Map<String, dynamic> data) => VideoCallRow(data);
}

class VideoCallRow extends SupabaseDataRow {
  VideoCallRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VideoCallTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get appID => getField<int>('appID');
  set appID(int? value) => setField<int>('appID', value);

  String? get appSign => getField<String>('appSign');
  set appSign(String? value) => setField<String>('appSign', value);
}
