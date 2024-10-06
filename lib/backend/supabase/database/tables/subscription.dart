import '../database.dart';

class SubscriptionTable extends SupabaseTable<SubscriptionRow> {
  @override
  String get tableName => 'Subscription';

  @override
  SubscriptionRow createRow(Map<String, dynamic> data) => SubscriptionRow(data);
}

class SubscriptionRow extends SupabaseDataRow {
  SubscriptionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userID => getField<String>('UserID');
  set userID(String? value) => setField<String>('UserID', value);

  DateTime? get buyTime => getField<DateTime>('BuyTime');
  set buyTime(DateTime? value) => setField<DateTime>('BuyTime', value);

  String? get subacriptionType => getField<String>('Subacription_Type');
  set subacriptionType(String? value) =>
      setField<String>('Subacription_Type', value);
}
