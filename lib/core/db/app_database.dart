import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {

  AppDatabase._();

  static Database? _database;

  static Future<Database?> get database async => _database ?? await initDB();

  static Future<Database?> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'xyz.db');
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database;
  }

  static Future _createDB(Database db, int version) async {
   await db.execute("CREATE TABLE IF NOT EXISTS employees ("
        "id integer NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "first_name varchar DEFAULT NULL,"
        "last_name varchar DEFAULT NULL,"
        "designation varchar DEFAULT NULL,"
        "level integer DEFAULT 0,"
        "productivity_score double DEFAULT 0,"
        "current_salary varchar DEFAULT NULL,"
        "employment_status integer DEFAULT NULL)");
  }

  static Future close() async {
    _database!.close();
  }
}