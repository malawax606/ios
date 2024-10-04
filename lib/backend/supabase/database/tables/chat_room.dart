import '../database.dart';

class ChatRoomTable extends SupabaseTable<ChatRoomRow> {
  @override
  String get tableName => 'Chat_Room';

  @override
  ChatRoomRow createRow(Map<String, dynamic> data) => ChatRoomRow(data);
}

class ChatRoomRow extends SupabaseDataRow {
  ChatRoomRow(super.data);

  @override
  SupabaseTable get table => ChatRoomTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get lastMesageSentTime =>
      getField<DateTime>('last_mesage_sent_time')!;
  set lastMesageSentTime(DateTime value) =>
      setField<DateTime>('last_mesage_sent_time', value);

  String? get user => getField<String>('User');
  set user(String? value) => setField<String>('User', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  String? get lastMessageSentBy => getField<String>('last_message_sent_by');
  set lastMessageSentBy(String? value) =>
      setField<String>('last_message_sent_by', value);

  String? get lastMessageSeenBy => getField<String>('last_message_seen_by');
  set lastMessageSeenBy(String? value) =>
      setField<String>('last_message_seen_by', value);

  String? get userA => getField<String>('user_a');
  set userA(String? value) => setField<String>('user_a', value);

  String? get userB => getField<String>('user_b');
  set userB(String? value) => setField<String>('user_b', value);

  String? get userChated => getField<String>('user_chated');
  set userChated(String? value) => setField<String>('user_chated', value);

  bool? get mesageSeen => getField<bool>('Mesage_seen');
  set mesageSeen(bool? value) => setField<bool>('Mesage_seen', value);

  String get chatID => getField<String>('Chat_ID')!;
  set chatID(String value) => setField<String>('Chat_ID', value);

  int get messageNum => getField<int>('Message_Num')!;
  set messageNum(int value) => setField<int>('Message_Num', value);

  bool get typing => getField<bool>('Typing')!;
  set typing(bool value) => setField<bool>('Typing', value);

  String? get messageUn => getField<String>('Message Un');
  set messageUn(String? value) => setField<String>('Message Un', value);

  List<String> get users => getListField<String>('Users');
  set users(List<String>? value) => setListField<String>('Users', value);

  bool get usersDone => getField<bool>('Users_Done')!;
  set usersDone(bool value) => setField<bool>('Users_Done', value);
}
