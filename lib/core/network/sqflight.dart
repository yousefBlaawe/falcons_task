import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    try {
      _database = await _initDatabase();
      return _database!;
    } catch (e) {
      log('Database initialization error: $e');
      rethrow;
    }
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'merged_data.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: createDatabase,
      );
    } catch (e) {
      log('Error opening database: $e');
      rethrow;
    }
  }

  Future<void> createDatabase(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE merged_data (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          comapnyno TEXT,
          itemno TEXT,
          itemocode TEXT,
          name TEXT,
          barcode TEXT,
          qty REAL,
          categoryid TEXT,
          itemk TEXT,
          minprice TEXT,
          iteml TEXT,
          issuspended TEXT,
          f_d TEXT,
          itemhasserial TEXT,
          itempicspath TEXT,
          taxperc TEXT,
          isapipic TEXT,
          lsprice TEXT
        )
      ''');
    } catch (e) {
      log('Error creating table: $e');
      rethrow;
    }
  }

  Future<void> insertData(List<Map<String, dynamic>> data) async {
    final db = await database;
    try {
      for (var record in data) {
        await db.insert('merged_data', record);
      }
    } catch (e) {
      log('Error inserting data: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    try {
      return await db.query('merged_data');
    } catch (e) {
      log('Error fetching data: $e');
      rethrow;
    }
  }
}
