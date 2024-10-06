import '../database.dart';

class StoriesTable extends SupabaseTable<StoriesRow> {
  @override
  String get tableName => 'Stories';

  @override
  StoriesRow createRow(Map<String, dynamic> data) => StoriesRow(data);
}

class StoriesRow extends SupabaseDataRow {
  StoriesRow(super.data);

  @override
  SupabaseTable get table => StoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('User');
  set user(String? value) => setField<String>('User', value);

  String? get image => getField<String>('Image');
  set image(String? value) => setField<String>('Image', value);

  String? get video => getField<String>('Video');
  set video(String? value) => setField<String>('Video', value);

  List<String> get views => getListField<String>('views');
  set views(List<String>? value) => setListField<String>('views', value);

  DateTime? get expiredTime => getField<DateTime>('Expired_Time');
  set expiredTime(DateTime? value) => setField<DateTime>('Expired_Time', value);

  String? get text => getField<String>('Text');
  set text(String? value) => setField<String>('Text', value);

  String? get gender => getField<String>('Gender');
  set gender(String? value) => setField<String>('Gender', value);

  String? get storieText => getField<String>('Storie_Text');
  set storieText(String? value) => setField<String>('Storie_Text', value);
}
