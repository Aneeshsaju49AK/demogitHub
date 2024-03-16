import 'package:demogit_01/model/person_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseVersion = 1;

  static const _databaseName = "PersonDetails";

  static const tableName = "Person";

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnPlace = 'place';
  static const columnMobileNumber = 'mobileNumber';
  static const columnEmail = 'email';
  static const columnProfilePicture = 'profile_picture';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute('''
        CREATE TABLE $tableName(
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnName TEXT NOT NULL,
          $columnAge INTEGER NOT NULL,
          $columnPlace TEXT NOT NULL,
          $columnMobileNumber INTEGER NOT NULL,
          $columnProfilePicture TEXT NOT NULL,
          $columnEmail TEXT UNIQUE KEY,
        )
      ''');
  }

  Future<int> insertPerson(Person person) async {
    final db = await database;
    return await db.insert(tableName, {
      columnId: person.id,
      columnName: person.name,
      columnAge: person.age,
      columnPlace: person.place,
      columnMobileNumber: person.mobileNumber,
      columnEmail: person.age,
      columnProfilePicture: person.profilePicturePath,
    });
  }

  Future<List<Person>> getPerson() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(
        maps.length,
        (index) => Person(
              id: maps[index][columnId],
              name: maps[index][columnName],
              age: maps[index][columnAge],
              place: maps[index][columnPlace],
              mobileNumber: maps[index][columnMobileNumber],
              email: maps[index][columnEmail],
              profilePicturePath: maps[index][columnProfilePicture],
            ));
  }
}
