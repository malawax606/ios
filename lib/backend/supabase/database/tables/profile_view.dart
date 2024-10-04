import '../database.dart';

class ProfileViewTable extends SupabaseTable<ProfileViewRow> {
  @override
  String get tableName => 'Profile_View';

  @override
  ProfileViewRow createRow(Map<String, dynamic> data) => ProfileViewRow(data);
}

class ProfileViewRow extends SupabaseDataRow {
  ProfileViewRow(super.data);

  @override
  SupabaseTable get table => ProfileViewTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get ownerID => getField<String>('OwnerID');
  set ownerID(String? value) => setField<String>('OwnerID', value);

  String? get viewID => getField<String>('ViewID');
  set viewID(String? value) => setField<String>('ViewID', value);

  String? get idNum => getField<String>('ID_NUM');
  set idNum(String? value) => setField<String>('ID_NUM', value);
}
