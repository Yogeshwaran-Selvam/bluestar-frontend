import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ac_control.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _executeSQLFromAsset(db, 'ac_units.sql');
        await _executeSQLFromAsset(db, 'energy_insights.sql');
      },
    );
  }

  static Future<void> _executeSQLFromAsset(Database db, String assetPath) async {
    final sql = await rootBundle.loadString(assetPath);
    final statements = sql.split(';');
    for (final stmt in statements) {
      final trimmed = stmt.trim();
      if (trimmed.isNotEmpty) {
        await db.execute(trimmed);
      }
    }
  }
}