// lib/service/database_provider.dart
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:office_archiving/models/section.dart';

class DatabaseProvider {
  static const String dbName = 'office_archiving.db';
  static const String sectionTable = 'sections';

  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance = DatabaseProvider._privateConstructor();

  late Database _database;

  Future<Database> get database async {
    if (_database.isOpen) return _database;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return _database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $sectionTable (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL
      )
    ''');
  }

  Future<List<Section>> getSections() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(sectionTable);
    return List.generate(maps.length, (i) {
      return Section(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> insertSection(Section section) async {
    final Database db = await database;
    await db.insert(
      sectionTable,
      section.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateSection(Section section) async {
    final Database db = await database;
    await db.update(
      sectionTable,
      section.toMap(),
      where: 'id = ?',
      whereArgs: [section.id],
    );
  }

  Future<void> deleteSection(int sectionId) async {
    final Database db = await database;
    await db.delete(
      sectionTable,
      where: 'id = ?',
      whereArgs: [sectionId],
    );
  }
}
