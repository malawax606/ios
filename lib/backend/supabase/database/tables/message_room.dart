import '../database.dart';

class MessageRoomTable extends SupabaseTable<MessageRoomRow> {
  @override
  String get tableName => 'Message_Room';

  @override
  MessageRoomRow createRow(Map<String, dynamic> data) => MessageRoomRow(data);
}

class MessageRoomRow extends SupabaseDataRow {
  MessageRoomRow(super.data);

  @override
  SupabaseTable get table => MessageRoomTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('User');
  set user(String? value) => setField<String>('User', value);

  String? get text => getField<String>('Text');
  set text(String? value) => setField<String>('Text', value);

  String? get image => getField<String>('Image');
  set image(String? value) => setField<String>('Image', value);

  String? get replyOrginal => getField<String>('Reply_Orginal');
  set replyOrginal(String? value) => setField<String>('Reply_Orginal', value);

  String? get replyNew => getField<String>('Reply_New');
  set replyNew(String? value) => setField<String>('Reply_New', value);

  String? get chatID => getField<String>('Chat_ID');
  set chatID(String? value) => setField<String>('Chat_ID', value);

  String? get textEdited => getField<String>('text_edited');
  set textEdited(String? value) => setField<String>('text_edited', value);

  String? get love => getField<String>('Love');
  set love(String? value) => setField<String>('Love', value);

  bool get delete => getField<bool>('Delete')!;
  set delete(bool value) => setField<bool>('Delete', value);

  bool get edit => getField<bool>('Edit')!;
  set edit(bool value) => setField<bool>('Edit', value);

  String? get storyReply => getField<String>('Story_Reply');
  set storyReply(String? value) => setField<String>('Story_Reply', value);

  String? get storyImage => getField<String>('Story_Image');
  set storyImage(String? value) => setField<String>('Story_Image', value);

  String? get replyReplyOrginal => getField<String>('Reply_Reply_Orginal');
  set replyReplyOrginal(String? value) =>
      setField<String>('Reply_Reply_Orginal', value);

  String? get replyReplyNew => getField<String>('Reply_Reply_New');
  set replyReplyNew(String? value) =>
      setField<String>('Reply_Reply_New', value);
}
