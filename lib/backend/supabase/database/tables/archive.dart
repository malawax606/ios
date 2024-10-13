import '../database.dart';

class ArchiveTable extends SupabaseTable<ArchiveRow> {
  @override
  String get tableName => 'Archive';

  @override
  ArchiveRow createRow(Map<String, dynamic> data) => ArchiveRow(data);
}

class ArchiveRow extends SupabaseDataRow {
  ArchiveRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArchiveTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('User_id')!;
  set userId(String value) => setField<String>('User_id', value);

  List<String> get chatId => getListField<String>('Chat_Id');
  set chatId(List<String>? value) => setListField<String>('Chat_Id', value);
}
