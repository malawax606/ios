import 'package:sqflite/sqflite.dart';

/// BEGIN ADD
Future performAdd(
  Database database, {
  String? userID,
  String? text,
}) {
  final query = '''
INSERT INTO messages (UserID, Text) VALUES ('$userID',  '$text', );
''';
  return database.rawQuery(query);
}

/// END ADD
