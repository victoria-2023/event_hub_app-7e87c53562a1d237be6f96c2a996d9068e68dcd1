import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<void> initializeDatabase() async {
    _database = await _initDb();
  }

  static Future<Database> get database async {
    if (_database == null) {
      await initializeDatabase();
    }
    return _database!;
  }

  // Initialize the database
  static Future<Database> _initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "app_data.db");
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  // Create database tables
  static Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE events (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date TEXT,
        imagePath TEXT
      );
    ''');
  }

  // Add an event to the database
  Future<int> addEvent(String title, String description, String date,
      String imagePath) async {
    final db = await database;
    return await db.insert('events', {
      'title': title,
      'description': description,
      'date': date,
      'imagePath': imagePath
    });
  }

  // Retrieve all events from the database
  Future<List<Map<String, dynamic>>> getAllEvents() async {
    final db = await database;
    return await db.query('events');
  }

  // Update an existing event
  Future<int> updateEvent(int id, String title, String description, String date,
      String imagePath) async {
    final db = await database;
    return await db.update(
        'events',
        {
          'title': title,
          'description': description,
          'date': date,
          'imagePath': imagePath
        },
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Delete an event
  Future<int> deleteEvent(int id) async {
    final db = await database;
    return await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }

}