import 'package:shop_barcode_scan_v3/test.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';

class SqLiteHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initWinDB();
    return _database!;
  }

  Future<Database> initWinDB() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    return await databaseFactory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(onCreate: _onCreate, version: 1),
    );
  }

  Future<void> _onCreate(Database database, int version) async {
    final db = database;
    await db.execute(
      """CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY,empId TEXT ,firstName TEXT,lastName TEXT)""",
    );
  }

  Future<User> insertUser(User user) async {
    final db = await database;
    db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return user;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, ((index) {
      return User(
        empId: maps[index]['id'],
        firstName: maps[index]['firstName'],
        lastName: maps[index]['lastName'],
        isLead: maps[index]['isLead'],
      );
    }));
  }
}
