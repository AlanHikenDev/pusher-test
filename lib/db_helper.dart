import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openDB() async {
  return openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT)',
      );
    },
    version: 1,
  );
}

Future<void> insertUser(Map<String, dynamic> user) async {
  final db = await openDB();
  await db.insert(
    'users',
    user,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await openDB();
  return await db.query('users');
}

Future<void> deleteUser(int id) async {
  final db = await openDB();
  await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}
