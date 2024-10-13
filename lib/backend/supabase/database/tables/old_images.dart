import '../database.dart';

class OldImagesTable extends SupabaseTable<OldImagesRow> {
  @override
  String get tableName => 'old Images';

  @override
  OldImagesRow createRow(Map<String, dynamic> data) => OldImagesRow(data);
}

class OldImagesRow extends SupabaseDataRow {
  OldImagesRow(super.data);

  @override
  SupabaseTable get table => OldImagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
