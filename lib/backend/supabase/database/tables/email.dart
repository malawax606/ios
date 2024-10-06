import '../database.dart';

class EmailTable extends SupabaseTable<EmailRow> {
  @override
  String get tableName => 'Email';

  @override
  EmailRow createRow(Map<String, dynamic> data) => EmailRow(data);
}

class EmailRow extends SupabaseDataRow {
  EmailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmailTable();

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get externalId => getField<String>('external_id')!;
  set externalId(String value) => setField<String>('external_id', value);

  String get subscribed => getField<String>('subscribed')!;
  set subscribed(String value) => setField<String>('subscribed', value);
}
