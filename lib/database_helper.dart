import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    print('Database path: $path'); // Debug: Print database path
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print('Creating database...'); // Debug: Print when database is created
        await db.execute(''' 
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT UNIQUE,
          phone TEXT,
          city TEXT,
          gender TEXT,
          birthdate TEXT,
          password TEXT
        )
      ''');
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query('users'); // Fetch all users from the users table
  }

  Future<bool> emailExists(String email) async {
    final db = await database;
    print("Database path: ${db.path}");
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    print("Email check result: $result");
    return result.isNotEmpty;
  }

  Future<void> _pickProfileImage() async {
    // This should be implemented properly; it's just a placeholder for now
    print("Picking profile image...");
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> users =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    print('Users fetched from DB: $users'); // Debug print to check fetched data
    return users.isNotEmpty ? users.first : null;
  }
}
