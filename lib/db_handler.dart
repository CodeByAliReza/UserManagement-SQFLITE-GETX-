import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_practice/db_extension.dart';
import 'package:sqflite_practice/db_model.dart';

class DbHandler with DbExtension {
  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    Directory directory =
        await getApplicationDocumentsDirectory(); // create a directory
    String path = join(
      directory.path,
      'my_database.db',
    ); // join the directory path with the database name
    _database = await openDatabase(path, version: 2, onCreate: _onCreate);
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE user(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
email TEXT UNIQUE
)

''');
  }

  Future<String?> insertData(DbModel model) async {
    try {
      Database db = await database();
      final data = model.toMap();
      await db.insert('user', data, conflictAlgorithm: ConflictAlgorithm.fail);
      return null; // Success!
    } catch (e) {
      if (e.toString().contains('UNIQUE')) {
        return 'This email is already registered.';
      }
      return 'An unexpected error occurred.';
    }
  }

  Future<List<DbModel>> readData() async {
    Database db = await database();
    final list = await db.query('user');
    return list.map((map) => DbModel.fromMap(map)).toList();
  }

  Future<void> deleteData(int id) async {
    Database db = await database();
    final count = await db.delete('user', where: 'id = ?', whereArgs: [id]);
    wasOperationSuccessfull(count, id);
  }

  Future<void> updateData(DbModel dbModel) async {
    Database db = await database();
    final count = await db.update(
      'user',
      dbModel.toMap(),
      where: 'id = ?',
      whereArgs: [dbModel.id],
    );
    wasOperationSuccessfull(count, dbModel.id!);
  }
}
