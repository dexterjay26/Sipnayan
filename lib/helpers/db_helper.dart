import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'scores.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE leaderboard(id TEXT PRIMARY KEY, name TEXT, score TEXT, time TEXT, type TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.transaction((txn) async {
      await txn.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    });
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();

    return db.query(table);
  }
}
