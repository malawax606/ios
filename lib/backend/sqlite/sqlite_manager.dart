import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'sqlite',
      'Test-Db.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetRow>> get({
    String? id,
  }) =>
      performGet(
        _database,
        id: id,
      );

  Future<List<GetAllRow>> getAll() => performGetAll(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future add({
    String? userID,
    String? text,
  }) =>
      performAdd(
        _database,
        userID: userID,
        text: text,
      );

  /// END UPDATE QUERY CALLS
}
