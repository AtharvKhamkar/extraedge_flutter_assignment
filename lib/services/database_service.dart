import 'package:extraedge_spacex/services/sql_functions_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService.internal();
  factory DatabaseService() => instance;
  DatabaseService.internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    await _enableForeignKeySupport(_db!);
    return _db!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'spacex_rockets.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Table creation will be handled by SQLFunctions
  }

  Future<void> _enableForeignKeySupport(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<String> createTable(
      String tableName, Map<String, String> columns) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'");
    if (result.isNotEmpty) {
      debugPrint("Table '$tableName' already exists");
      return "Table '$tableName' already exists";
    }

    String columnsString =
        columns.entries.map((e) => '${e.key} ${e.value}').join(', ');
    String sql = 'CREATE TABLE $tableName ($columnsString)';
    await db.execute(sql);
    debugPrint("Table '$tableName' created successfully.");
    return "Table '$tableName' created successfully.";
  }

  Future<int> insert(String tableName, Map<String, dynamic> values) async {
    final db = await database;
    return await db.insert(tableName, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(String tableName, Map<String, dynamic> values,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.update(tableName, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> displayTable(String tableName) async {
    final db = await database;
    return await db.query(tableName);
  }

  Future<int> delete(String tableName,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.delete(tableName, where: where, whereArgs: whereArgs);
  }

  Future<void> dropTable(String tableName) async {
    final db = await database;
    await db.execute('DROP TABLE IF EXISTS $tableName');
  }

  Future<List<Map<String, dynamic>>> queryTable(String tableName,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.query(tableName, where: where, whereArgs: whereArgs);
  }

  Future<void> processRockets() async {
    final sqlFunctionsService = SqlFunctionsService();
    await sqlFunctionsService.createRocketsTable();
  }
}
