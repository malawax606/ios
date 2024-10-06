import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'Comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('User');
  set user(String? value) => setField<String>('User', value);

  int? get postID => getField<int>('PostID');
  set postID(int? value) => setField<int>('PostID', value);

  String? get comment => getField<String>('Comment');
  set comment(String? value) => setField<String>('Comment', value);

  List<String> get commentLove => getListField<String>('Comment_Love');
  set commentLove(List<String>? value) =>
      setListField<String>('Comment_Love', value);
}
