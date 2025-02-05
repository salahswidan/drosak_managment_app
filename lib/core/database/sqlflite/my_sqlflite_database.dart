import 'package:drosak_managment_app/core/database/sqlflite/crud.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDataBase;
import 'package:path/path.dart';

class MySqlFliteDatabase extends Crud {
  sqfliteDataBase.Database? _db;
  static const String educationalStageTableName = 'educationalStageTableName';
  static const String educationalStageID = 'id';
  static const String educationalStageName = 'name';
  static const String educationalStageDesc = 'desc';
  static const String educationalStageImage = 'image';
  static const String educationalStageCreatedAt = 'created_at';
  static const String educationalStageStatus = 'status';

  Future<sqfliteDataBase.Database> _initDatabase() async {
    String databasesPath = await sqfliteDataBase.getDatabasesPath();
    String drosakDatabaseName = "drosak.db";
    String realDatabasePath = join(databasesPath, drosakDatabaseName);
    int versionDataBase = 7;
    _db ??= await sqfliteDataBase.openDatabase(realDatabasePath,
        onOpen: (db) async {
      await db.execute("PRAGMA foreign_keys = ON");
    }, onCreate: _onCreate, onUpgrade: _onUpgrade, version: versionDataBase);
    return _db!;
  }

  _onUpgrade(
      sqfliteDataBase.Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $educationalStageTableName");
    await db.execute("CREATE TABLE IF NOT EXISTS $educationalStageTableName"
        " ( $educationalStageID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $educationalStageName TEXT , "
        "  $educationalStageDesc TEXT , "
        "  $educationalStageStatus INTEGER DEFAULT 1  , "
        "  $educationalStageCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP , "
        "  $educationalStageImage  TEXT )");
    print(db);
    print(oldVersion);
    print(newVersion);
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS $educationalStageTableName"
        " ( $educationalStageID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $educationalStageName TEXT , "
        "  $educationalStageDesc TEXT , "
        "  $educationalStageStatus INTEGER DEFAULT 1 , "
        "  $educationalStageCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP , "
        "  $educationalStageImage  TEXT )");
  }

  @override
  Future<bool> insert(
      {required String tableName, required Map<String, Object?> values}) async {
    await _initDatabase();
    int inserted = await _db!.insert(tableName, values);
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  @override
  Future<bool> delete(
      {required String tableName, required String where}) async {
    await _initDatabase();
    int deleted = await _db!.delete(tableName, where: where);
    await _db!.close();
    return deleted > 0 ? true : false;
  }

  @override
  Future<List<Map<String, Object?>>> select({required String tableName,String? where,List<Object?>? whereArgs}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(tableName,where:where ,whereArgs: whereArgs);
    await _db!.close();
    return data;
  }

  @override
  Future<List<Map<String, Object?>>> search(
      {required String tableName, required String searchWord}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(tableName,
        where: '$educationalStageName LIKE ?', whereArgs: ['%$searchWord%']);
    await _db!.close();
    return data;
  }

  @override
  Future<bool> update(
      {required String tableName,
      required Map<String, Object?> values,
      List<Object?>? whereArgs,
      required String where}) async {
    await _initDatabase();
    int updated = await _db!.update(tableName, values, where: where,whereArgs: whereArgs);
    await _db!.close();
    return updated > 0 ? true : false;
  }
}
