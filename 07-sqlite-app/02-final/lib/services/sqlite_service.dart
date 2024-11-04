// todo-01-service-03: create a service that handle a database services
import 'package:sqlite_app/model/profile.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  // todo-01-service-04: make a static value
  static const String _databaseName = 'profilelist.db';
  static const String _tableName = 'profile';
  static const int _version = 1;

  // todo-01-service-05: add a table to create a table
  Future<void> createTables(Database database) async {
    await database.execute(
      """CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        phoneNumber TEXT,
        maritalStatus INTEGER
      )
      """,
    );
  }

  // todo-01-service-06: make connection with database
  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // todo-01-service-07: create new item
  Future<int> insertItem(Profile profile) async {
    final db = await _initializeDb();

    final data = profile.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Profile>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName, orderBy: "id");

    return results.map((result) => Profile.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Profile> getItemById(int id) async {
    final db = await _initializeDb();
    final results =
        await db.query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);

    return results.map((result) => Profile.fromJson(result)).first;
  }

  // todo-01-service-10: update an item by id
  Future<int> updateItem(int id, Profile profile) async {
    final db = await _initializeDb();

    final data = profile.toJson();

    final result =
        await db.update(_tableName, data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // todo-01-service-11: delete an item by id
  Future<int> removeItem(int id) async {
    final db = await _initializeDb();

    final result =
        await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
