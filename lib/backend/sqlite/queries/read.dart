import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET
Future<List<GetRow>> performGet(
  Database database, {
  String? id,
}) {
  const query = '''
SELECT * FROM Messages WHERE userId = id;

''';
  return _readQuery(database, query, (d) => GetRow(d));
}

class GetRow extends SqliteRow {
  GetRow(super.data);

  String? get userID => data['UserID'] as String?;
  String? get text => data['Text'] as String?;
  String? get id => data['id'] as String?;
}

/// END GET

/// BEGIN GET ALL
Future<List<GetAllRow>> performGetAll(
  Database database,
) {
  const query = '''
SELECT * FROM Messages ;

''';
  return _readQuery(database, query, (d) => GetAllRow(d));
}

class GetAllRow extends SqliteRow {
  GetAllRow(super.data);

  String? get userID => data['UserID'] as String?;
  String? get text => data['Text'] as String?;
  String? get id => data['id'] as String?;
}

/// END GET ALL
