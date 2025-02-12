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
//!-----------------------------group Table-------------------------------------!
  static const String groupTableName = 'groups';
  static const String groupColumnName = 'name';
  static const String groupColumnID = 'id';
  static const String groupColumnNote = 'note';
  static const String groupColumnIDEducation = 'educationID';
//!-----------------------------Appointments Table-------------------------------------!
  static const String appointmentsTableName = 'Appointments';
  static const String appointmentsColumnID = 'id';
  static const String appointmentsColumnDay = 'day';
  static const String appointmentsColumnTime = 'time';
  static const String appointmentsColumnMS = 'MS';
  static const String appointmentsColumnIDGroup = 'idGroups';

  Future<sqfliteDataBase.Database> _initDatabase() async {
    String databasesPath = await sqfliteDataBase.getDatabasesPath();
    String drosakDatabaseName = "drosak.db";
    String realDatabasePath = join(databasesPath, drosakDatabaseName);
    int versionDataBase = 6;
    _db ??= await sqfliteDataBase.openDatabase(realDatabasePath,
        onOpen: (db) async {
      await db.execute("PRAGMA foreign_keys = ON");
    }, onCreate: _onCreate, onUpgrade: _onUpgrade, version: versionDataBase);
    return _db!;
  }

  _onUpgrade(
      sqfliteDataBase.Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $educationalStageTableName");
      await db.execute("DROP TABLE IF EXISTS $groupTableName");
      await db.execute("DROP TABLE IF EXISTS $appointmentsTableName");

    await db.execute("CREATE TABLE IF NOT EXISTS $educationalStageTableName"
        " ( $educationalStageID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $educationalStageName TEXT , "
        "  $educationalStageDesc TEXT , "
        "  $educationalStageStatus INTEGER DEFAULT 1  , "
        "  $educationalStageCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP , "
        "  $educationalStageImage  TEXT )");
    await db.execute("CREATE TABLE IF NOT EXISTS $groupTableName"
        " ( $groupColumnID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $groupColumnName TEXT , "
        "  $groupColumnNote  TEXT , "
        "  $groupColumnIDEducation  INTEGER)");
    await db.execute("CREATE TABLE IF NOT EXISTS $appointmentsTableName"
        " ( $appointmentsColumnID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $appointmentsColumnDay TEXT , "
        "  $appointmentsColumnTime TEXT , "
        "  $appointmentsColumnMS TEXT , "
        "  $appointmentsColumnIDGroup  INTEGER , "
        " CONSTRAINT group_and_appointment FOREIGN KEY ($appointmentsColumnIDGroup) REFERENCES $groupTableName ($groupColumnID) ON DELETE CASCADE ON UPDATE CASCADE "
        ")");
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
    //! ---------------------------Create Educational Stage Table---------------------------------------
    await db.execute("CREATE TABLE IF NOT EXISTS $educationalStageTableName"
        " ( $educationalStageID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $educationalStageName TEXT , "
        "  $educationalStageDesc TEXT , "
        "  $educationalStageStatus INTEGER DEFAULT 1 , "
        "  $educationalStageCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP , "
        "  $educationalStageImage  TEXT )");
    //! ---------------------------Create Groups Table---------------------------------------
    await db.execute("CREATE TABLE IF NOT EXISTS $groupTableName"
        " ( $groupColumnID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $groupColumnName TEXT , "
        "  $groupColumnNote  TEXT , "
        "  $groupColumnIDEducation  INTEGER)");
    //! ---------------------------Create appointments Table---------------------------------------
    await db.execute("CREATE TABLE IF NOT EXISTS $appointmentsTableName"
        " ( $appointmentsColumnID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $appointmentsColumnDay TEXT , "
        "  $appointmentsColumnTime TEXT , "
        "  $appointmentsColumnMS TEXT , "
        "  $appointmentsColumnIDGroup  INTEGER , "
        " CONSTRAINT group_and_appointment FOREIGN KEY ($appointmentsColumnIDGroup) REFERENCES $groupTableName ($groupColumnID) ON DELETE CASCADE ON UPDATE CASCADE "
        ")");
  }

  @override
  Future<bool> insert(
      {required String tableName, required Map<String, Object?> values}) async {
    await _initDatabase();
    int inserted = await _db!.insert(tableName, values);
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  
  Future<int> insertAndReturnedId(
      {required String tableName, required Map<String, Object?> values}) async {
    await _initDatabase();
    int inserted = await _db!.insert(tableName, values);
    await _db!.close();
    return inserted ;
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
  Future<List<Map<String, Object?>>> select(
      {required String tableName,
      String? where,
      List<Object?>? whereArgs}) async {
    await _initDatabase();
    List<Map<String, Object?>> data =
        await _db!.query(tableName, where: where, whereArgs: whereArgs);
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
    int updated = await _db!
        .update(tableName, values, where: where, whereArgs: whereArgs);
    await _db!.close();
    return updated > 0 ? true : false;
  }
}
