import 'package:drosak_managment_app/core/database/sqlflite/crud.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDataBase;
import 'package:path/path.dart';

class MySqlFliteDatabase extends Crud {

  sqfliteDataBase.Database? _db;
      static const String _educationalStageTableName = 'educationalStageTableName';
      static const String educationalStageID = 'id';
      static const String educationalStageName = 'name';
      static const String educationalStageDesc = 'desc';
      static const String educationalStageImage = 'image';


  Future<sqfliteDataBase.Database> _initDatabase() async {
    String databasePath = await sqfliteDataBase.getDatabasesPath();
    String drosakDataBaseName = 'drosak.db';
    String realDatabasePath = join(databasePath, drosakDataBaseName);
    int versionDataBase = 1;
    _db ??= await sqfliteDataBase.openDatabase(realDatabasePath,
        onOpen: (db) async {
      await db.execute("PRAGMA foreign_keys = ON");
    }, onCreate: _onCreate, onUpgrade: _onUpgrade, version: versionDataBase);
    return _db!;
  }

  _onUpgrade(
      sqfliteDataBase.Database db, int oldVersion, int newVersion) async {
    print(db);
    print(oldVersion);
    print(newVersion);
    // await db.execute(
    //   'CREATE TABLE IF NOT EXISTS testTable (id INTEGER) ;',
    // );
    // await db.execute("ALTER TABLE testTable RENAME TO TTT");
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS $_educationalStageTableName"
        " ( $educationalStageID INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "  $educationalStageName TEXT , "
        "  $educationalStageDesc TEXT , "      
        "  $educationalStageImage  TEXT )");
    // await db.execute(
    //     'CREATE TABLE IF NOT EXISTS $_productTable ($_productColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_productColumnName TEXT ,$_productColumnPrice REAL, $_productColumnCount INTEGER);');
    // await db.execute(
    //     'CREATE TABLE  IF NOT EXISTS $_salesTable ($_salesColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_salesColumnProductID INTEGER ,$_salesColumnUserID INTEGER    ,"CONSTRAINT user_sales_relation FOREIGN KEY($_salesColumnUserID) REFERENCES $_userTable($_userColumnID) ON DELETE CASCADE ON UPDATE CASCADE ," "CONSTRAINT product_sales_relation FOREIGN KEY($_salesColumnProductID) REFERENCES $_productTable($_productColumnID) ON DELETE CASCADE ON UPDATE CASCADE  ");');
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
  Future<List<Map<String, Object?>>> select({required String tableName}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(tableName);
    await _db!.close();
    return data;
  }
  @override
  Future<bool> update(
      {required String tableName,
      required Map<String, Object?> values,
      required String where}) async {
    await _initDatabase();
    int updated = await _db!.update(tableName, values, where: where);
    await _db!.close();
    return updated > 0 ? true : false;
  }

  
}
